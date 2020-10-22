namespace :delete_last_week_task do
    desc "先週までの完了タスクを全て削除する"
    task :del_task => :environment do
        Task.all.where(completed: true).delete_all
    end
end
