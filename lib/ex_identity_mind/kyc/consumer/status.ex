defmodule ExIdentityMind.KYC.Consumer.Status do
  @moduledoc """
  KYC consumer application status information.
  More info: https://documentation.identitymindglobal.com/api/#kyc:-consumer-application
  """

  @type t :: %__MODULE__{
          # The transaction ID for this KYC
          mtid: String.t(),
          acVerification: String.t(),
          docVerification: any(),
          # List of owner applications associated with the merchant
          ownerApplicationIds: list(String.t()),
          parentMerchant: String.t(),
          smsVerification: String.t(),
          merchantAPIName: String.t(),
          # The current state of the KYC. Possible values are: "A" - accepted, "R" - Under Review, "D" - Rejected
          state: String.t(),
          oowQuestions: any(),
          # The current reputation of the user. Possible values are: TRUSTED, UNKNOWN, SUSPICIOUS, BAD
          user: String.t(),
          # The set of result codes from the evaluation of the current transaction.
          rcd: String.t(),
          # The name of the fraud rule that fired
          frn: String.t(),
          # The description of the fraud rule that fired
          frd: String.t(),
          # The score card for the current transaction
          ednaScoreCard: any(),
          # The description, if any, of the automated review rule that fired
          arpd: String.t(),
          # Result of the automated review evaluation.
          arpr: String.t(),
          # Result of fraud evaluation. Possible values are: ACCEPT, MANUAL_REVIEW, DENY
          frp: String.t(),
          # The previous reputation of the user when they were last evaluated. Possible values are: TRUSTED, UNKNOWN, SUSPICIOUS, BAD
          upr: String.t(),
          # A description of the reason for the user’s reputation
          erd: String.t(),
          # Result of policy evaluation. Combines the result of fraud and automated review evaluations. Possible values are: ACCEPT, MANUAL_REVIEW, DENY
          res: String.t(),
          # User seen count
          usc: String.t(),
          # The transaction ID.
          tid: String.t()
        }

  defstruct [
    :mtid,
    :acVerification,
    :docVerification,
    :ownerApplicationIds,
    :parentMerchant,
    :smsVerification,
    :merchantAPIName,
    :state,
    :oowQuestions,
    :user,
    :rcd,
    :frn,
    :frd,
    :ednaScoreCard,
    :arpd,
    :arpr,
    :frp,
    :upr,
    :erd,
    :res,
    :usc,
    :tid
  ]
end
