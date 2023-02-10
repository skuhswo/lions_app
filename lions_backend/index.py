import json
import stripe

stripe.api_key = '<api_key>'

YOUR_DOMAIN = 'https://spende.kaiserlions-hilfe.de/'

def handler(event, context):
  print('received event:')
  print(event)

  try:
      bodyStr = event["body"]
      body = json.loads(bodyStr)

      amountStr = body["amount"]
      donaitionReceiptStr = body["donationReceipt"]
      purposeStr = body["purpose"]
      emailStr = body["email"]
      nameStr = body["name"]
      streetStr = body["street"]
      zipCodeStr = body["zip_code"]
      cityStr = body["city"]
      countryStr = body["country"]

      amount = int(amountStr) * 100

      if emailStr != "":
          checkout_session = stripe.checkout.Session.create(
              submit_type='donate',
              payment_method_types=['card', 'giropay'],
              billing_address_collection='auto',
              line_items=[{
                  'price_data': {
                      'currency': 'eur',
                      'product_data': {
                          'name': 'Spende',
                      },
                      'unit_amount': amount,
                  },
                  'quantity': 1,
              }],
              payment_intent_data={
                  'metadata': {
                      'donationReceipt': donaitionReceiptStr,
                      'purpose': purposeStr,
                      'name': nameStr,
                      'street': streetStr,
                      'zipCode': zipCodeStr,
                      'city': cityStr,
                      'country': countryStr
                  },
              },
              customer_email=emailStr,
              mode='payment',
              locale='de',
              success_url=YOUR_DOMAIN + '/erfolg',
              cancel_url=YOUR_DOMAIN + '/abbruch',
          )
      else:
          checkout_session = stripe.checkout.Session.create(
              submit_type='donate',
              payment_method_types=['card', 'giropay'],
              billing_address_collection='auto',
              line_items=[{
                  'price_data': {
                      'currency': 'eur',
                      'product_data': {
                          'name': 'Spende',
                      },
                      'unit_amount': amount,
                  },
                  'quantity': 1,
              }],
              mode='payment',
              locale='de',
              success_url=YOUR_DOMAIN + '/erfolg',
              cancel_url=YOUR_DOMAIN + '/abbruch',
          )


  except Exception as e:
      return {
          'statusCode': 500,
          'headers': {
              'Access-Control-Allow-Headers': '*',
              'Access-Control-Allow-Origin': '*',
              'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'
          },
          'body': json.dumps(str(e))
      }

  return {
      'statusCode': 200,
      'headers': {
          'Access-Control-Allow-Headers': '*',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'
      },
      'body': json.dumps(checkout_session.url)
  }