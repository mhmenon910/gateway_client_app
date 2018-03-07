class DefaultController < ApplicationController

  def process_request  # mocking amount debited from account sending success status and returning statuses
  	@encrypted_string_from_client = params["msg"]
  	@result_from_client = EncryptDecryptString.new(@encrypted_string_from_client).decryption
    @payload_to_client = EncryptDecryptString.new(@result_from_client).encryption
    response = {}
    response["payload_to_client"] = @payload_to_client
    response["txn_status"] = "success"
    response["payment_gateway_transaction_reference"] = "pg_txn0001"
    render :json => response
 end
end