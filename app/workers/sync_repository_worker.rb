# frozen_string_literal: true

class SyncRepositoryWorker
  include Sidekiq::Worker
  sidekiq_options queue: :sync_subjects, unique: :until_and_while_executing

  def perform(remote_repository)
    Repository.sync(remote_repository)
  end
end
