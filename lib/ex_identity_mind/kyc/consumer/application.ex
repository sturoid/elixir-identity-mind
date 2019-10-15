defmodule ExIdentityMind.KYC.Consumer.Application do
  @moduledoc """
  KYC consumer application.
  More info: https://documentation.identitymindglobal.com/api/#kyc:-consumer-application
  """

  @type t :: %__MODULE__{
          # REQUIRED: Account name for the user. This must be a unique value to the user (email, UUID, etc.)
          man: String.t(),
          # Date of birth encoded as an ISO 8601 string (YYYY-MM-DD)
          dob: String.t(),
          # Social security number or national identification number
          assn: String.t(),
          # Last 4 digits of the applicant’s social security number or national identification number
          assnl4: String.t(),
          # Document front-side image data, Base64 encoded. 400KB minimum size, 4MB maximum size, color only.
          scanData: String.t(),
          # Document face image data, Base64 encoded. 400KB minimum size, 4MB maximum size, color only.
          faceImageData: String.t(),
          # Document back-side image data, Base64 encoded. 400KB minimum size, 4MB maximum size, color only.
          backsideImageData: String.t(),
          # Stage of application being processed. An integer between 1 and 5. If not provided, defaults to 1.
          stage: integer,
          # If this individual is linked to a merchant (business) as one of the owners of the business, this parameter should match the exact application ID of the merchant.
          merchantAid: String.t(),
          # If this individual is linked to a merchant (business) as one of the owners of the business, whether the individual provides a personal guarantee of debt
          personalguarantee: boolean,
          # If this individual is linked to a merchant (business) as one of the owners of the business, the percentage of ownership
          ownership: integer,
          # Title of the applicant
          title: String.t(),
          # Reflects the merchant’s merchantAPIname that was assigned on account creation
          m: String.t(),
          # Transaction identifier. If not provided, an ID will be allocated
          tid: String.t(),
          # Email address for the user
          tea: String.t(),
          # OAuth service that authenticated the user. For example, google or facebook
          soc: String.t(),
          # Customer’s IP address
          ip: String.t(),
          # Device fingerprint blog
          dfp: String.t(),
          # Device fingerprint type
          dft: String.t(),
          # Transaction time in UTC. Encoded as a Unix time stamp or ISO 8601 string. Data containing milliseconds will not be accepted.
          tti: String.t(),
          # Billing (source) first name
          bfn: String.t(),
          # Billing (source) last name
          bln: String.t(),
          # Credit card unique identifier (hash). IdentityMind will supply procedure to generate hash.
          pccn: String.t(),
          # A masked or tokenized version of the credit card number. IdentityMind will supply procedure to generate token.
          pcct: String.t(),
          # The card type. Possible values are: CREDIT, DEBIT, PREPAID, UNKNOWN
          pcty: String.t(),
          # Generic payment account unique identifier (hash). This is used when IdentityMind does not natively support the payment type.
          phash: String.t(),
          # A masked or tokenized version of the account token.
          ptoken: String.t(),
          # The policy profile to be used to evaluate this transaction. If no profile is specified, the DEFAULT profile is used. Prior to IDMRisk 1.19, this was encoded in the smid field.
          profile: String.t(),
          # Billing (source) street. Includes house number, street name, and apartment number.
          bsn: String.t(),
          # Billing (source) country. ISO 3166-1 alpha-2 country code of the billing address of the transaction. Default is US.
          bco: String.t(),
          # Billing (source) zip / postal code
          bz: String.t(),
          # Billing (source) city
          bc: String.t(),
          # Billing (source) state. Use official postal state/region abbreviations whenever possible (e.g. CA for California).
          bs: String.t(),
          # Shipping (destination) first name
          sfn: String.t(),
          # Shipping (destination) last name
          sln: String.t(),
          # Shipping (destination) street. Includes house number, street name, and apartment number.
          ssn: String.t(),
          # Shipping (destination) country. ISO 3166-1 alpha-2 country code of the billing address of the transaction. Default is US.
          sco: String.t(),
          # Shipping (destination) zip / postal code
          sz: String.t(),
          # Shipping (destination) city
          sc: String.t(),
          # Shipping (destination) state. Use official postal state/region abbreviations whenever possible (e.g. CA for California).
          ss: String.t(),
          # Affiliate ID. The client specific identifier for the affiliate that generated this transaction.
          aflid: String.t(),
          # The signup/affiliate creation date of the affiliate associated with this transaction.
          aflsd: String.t(),
          # User account creation time with the merchant in UTC. Encoded as a Unix timestamp.
          accountCreationTime: String.t(),
          # Customer browser language
          blg: String.t(),
          # Customer latitude
          clat: String.t(),
          # Customer longitude
          clong: String.t(),
          # Customer primary phone number
          phn: String.t(),
          # Customer mobile phone number
          pm: String.t(),
          # Customer work phone number
          pw: String.t(),
          # ACH account unique identifier (hash), Note: The hash must be of the full account number, not a masked or tokenized representation
          pach: String.t(),
          # Hash of the unique identifier for a Bitcoin wallet
          pbc: String.t(),
          # Free-form memo field for client use.
          memo: String.t()
        }

  @enforce_keys [:man]
  defstruct [
    :man,
    :dob,
    :assn,
    :assnl4,
    :scanData,
    :faceImageData,
    :backsideImageData,
    :stage,
    :merchantAid,
    :personalguarantee,
    :ownership,
    :title,
    :m,
    :tid,
    :tea,
    :soc,
    :ip,
    :dfp,
    :dft,
    :tti,
    :bfn,
    :bln,
    :pccn,
    :pcct,
    :pcty,
    :phash,
    :ptoken,
    :profile,
    :bsn,
    :bco,
    :bz,
    :bc,
    :bs,
    :sfn,
    :sln,
    :ssn,
    :sco,
    :sz,
    :sc,
    :ss,
    :aflid,
    :aflsd,
    :accountCreationTime,
    :blg,
    :clat,
    :clong,
    :phn,
    :pm,
    :pw,
    :pach,
    :pbc,
    :memo
  ]
end
