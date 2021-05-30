import React from 'react';
import StripeCheckout from 'react-stripe-checkout'

const StripeCheckoutButton = ({price}) => {

    //stripes wants to see $ in cents;
    const priceForStripe = price * 100;
    const publishableKey = 'pk_test_51IweVzD3GoEWQAscKCEeOqrC2CYsZbY6cXQdLOBZQpYY07sg5d7HjyAn0uCwy6qN282n0KfL05LIEHqw1qCqrei100ArxiKh2S';

    
    const onToken = token => {
        console.log(token);
        alert('Payment Successful')
    }

    return (
        <StripeCheckout 
            label='Pay Now'
            name='CRWN Clothing Ltd.'
            billingAddress
            shippingAddress
            image='https://svgshare.com/i/CUz.svg'
            description={`Your total is $${price}`}
            amount={priceForStripe}
            panelLabel='Pay Now'
            token={onToken}
            stripeKey={publishableKey}
        />
    )
}

export default StripeCheckoutButton