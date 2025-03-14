{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
import Web.Scotty
import Database.PostgreSQL.Simple
import Data.Aeson (ToJSON, FromJSON)
import GHC.Generics (Generic)
import Data.Text.Lazy (Text)
import Database.PostgreSQL.Simple.FromRow

data Task = Task
    { id :: Int
    , title :: Text
    , description :: Text
    , completed :: Bool
    } deriving (Generic, Show)

instance ToJSON Task
instance FromJSON Task
instance FromRow Task -- Asegúrate de tener esta instancia

main :: IO ()
main = do
    conn <- connectPostgreSQL "host=localhost dbname=todolist user=todouser password=password"
    scotty 3000 $ do
        get "/tasks" $ do
            tasks <- liftIO $ query_ conn "SELECT * FROM tasks" :: ActionM [Task] -- Anotación de tipo explícita aquí
            json tasks

        post "/tasks" $ do
            task <- jsonData :: ActionM Task
            _ <- liftIO $ execute conn "INSERT INTO tasks (title, description, completed) VALUES (?, ?, ?)"
                            (title task, description task, completed task)
            json ("Task added" :: Text)

        put "/tasks/:id" $ do
            taskId <- pathParam "id" :: ActionM Int
            task <- jsonData :: ActionM Task
            _ <- liftIO $ execute conn "UPDATE tasks SET title = ?, description = ?, completed = ? WHERE id = ?"
                            (title task, description task, completed task, taskId)
            json ("Task updated" :: Text)

        delete "/tasks/:id" $ do
            taskId <- pathParam "id" :: ActionM Int
            _ <- liftIO $ execute conn "DELETE FROM tasks WHERE id = ?" (Only taskId)
            json ("Task deleted" :: Text)
