class MessageTemplate
  # scope :for_account, ->( account ){
  #   companies_account_id = Company.arel_table[:account_id]
  #   accounts_id             = Account.arel_table[:id]
  #
  #   # 'uniq' is ActiveRecord's "SELECT DISTINCT"
  #   # the where clause is Arel for "companies.account_id = ? OR accounts.id = ?"
  #   uniq
  #     .joins( :company, :account )
  #     .where(
  #       companies_account_id.eq( account.id ).or( accounts_id.eq(account.id) )
  #     )
  # }

  def self.message_script
    MessageScript.arel_table
  end
  
  def self.find_originals_and_owned_by_current_user(current_user_id)
    MessageScript.where(
      MessageTemplate.message_script[:user_id]
        .eq(current_user_id)
        .or(MessageScript.arel_table[:original].eq(true)
      )
    )
  end

end
