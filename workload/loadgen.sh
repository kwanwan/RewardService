#!/bin/bash
# set ssl to true or false
SSL=false
SERVERIP=129.146.91.150
SERVERPORT=8080
APIS=/loyalty/v1
POINTAPI=/points
COFFEEAPI=/coupon
CSTART=40046
CSTOP=40055

if [ "$SSL" = "true" ]; then
  GURL="curl --silent --insecure https://$SERVERIP:$SERVERPORT"
  PURL="curl --request POST -d {} --silent --inscure https://$SERVERIP:$SERVERPORT"
else
  GURL="curl --silent http://$SERVERIP:$SERVERPORT"
  PURL="curl --request POST -d {} --silent http://$SERVERIP:$SERVERPORT"
fi


while :
do


# GET ALL
echo "=== GET ALL First"
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $GURL$APIS$POINTAPI/{}
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $GURL$APIS$COFFEEAPI/{}

# CREDIT STAR 1
echo "=== credit one star"
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $PURL$APIS$POINTAPI/{}

# GET ALL
echo "=== GET ALL after credit 1 star"
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $GURL$APIS$POINTAPI/{}
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $GURL$APIS$COFFEEAPI/{}

# CREDIT STAR 2
echo "=== credit 2nd star"
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $PURL$APIS$POINTAPI/{}

# GET ALL
echo "=== GET ALL after credit 2nd star"
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $GURL$APIS$POINTAPI/{}
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $GURL$APIS$COFFEEAPI/{}

# CREDIT STAR 3
echo "=== credit the 3rd star"
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $PURL$APIS$POINTAPI/{}


# GET ALL
echo "=== GET ALL after credit 3rd star"
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $GURL$APIS$POINTAPI/{}
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $GURL$APIS$COFFEEAPI/{}


# DRINK COFFEE
echo "=== consume 1 coffee"
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $PURL$APIS$COFFEEAPI/{}

# GET ALL
echo "=== GET ALL after redeem coffee"
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $GURL$APIS$POINTAPI/{}
  seq $CSTART $CSTOP | xargs -I{} -n 1 -P 10 $GURL$APIS$COFFEEAPI/{}

done
