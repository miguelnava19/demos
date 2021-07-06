package gasolinera

class InfoRQ {

     String email;
     String name;
     String lastName;
     String cardNumber;
     Integer expirationDateYear;
     String expirationDateMonth;
     Integer gasType;
     Double amount;
     String gasStation;
     String sellerName;

    static constraints = {
        email nullable: false, blank: false
        name nullable: false, blank: false
        lastName nullable: false, blank: false
        cardNumber nullable: false, blank: false
        expirationDateYear nullable: false, blank: false
        expirationDateMonth nullable: false, blank: false
        gasType nullable: false, blank: false
        amount nullable: false, blank: false
        gasStation nullable: false, blank: false
        sellerName nullable: false, blank: false
    }
}
