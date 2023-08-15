namespace :db do
  desc "Loads initial data into the database."
  task load_initial_data: :environment do
    puts 'Loading...'
    human_news_files = Dir['./dataset/Human/*']
    gpt_news_files = Dir['./dataset/ChatGPT/*']
    
    human_news_files.each do |news_article_path|
      NewsArticle.create!(
        content: File.read(news_article_path),
        label: 'H'
      )
    end

    gpt_news_files.each do |news_article_path|
      NewsArticle.create!(
        content: File.read(news_article_path),
        label: 'G'
      )
    end

    # Dir.open('./dataset/Human/').each do |file|
    #   NewsArticle.create!(
    #         content: File.read(file),
    #         label: 'H'
    #   )
    # end
  end
end