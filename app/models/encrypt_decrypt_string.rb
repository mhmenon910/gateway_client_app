class EncryptDecryptString
  # https://gurudathbn.wordpress.com/2015/02/04/aes-cipher-encryption-decryption-algorithms-using-ruby-on-rails/
  require 'openssl'
  require 'base64'
  KEY = 'Q9fbkBF8au24C9wshGRW9ut8ecYpyXye5vhFLtHFdGjRg3a4HxPYRfQaKutZx5N4'

  attr_accessor :parameters

  def initialize(params)
    @parameters = params
  end

  def encryption
   cipher = OpenSSL::Cipher::AES.new(128, :CBC)
   cipher.encrypt()
   cipher.key = KEY
   crypt = cipher.update(@parameters) + cipher.final()
   crypt_string = (Base64.encode64(crypt))
   return crypt_string
  end

  def decryption
    cipher = OpenSSL::Cipher::AES.new(128, :CBC)
    cipher.decrypt()
    cipher.key = KEY
    tempkey = Base64.decode64(@parameters)
    crypt = cipher.update(tempkey)
    crypt << cipher.final()
    return crypt
 end

end

