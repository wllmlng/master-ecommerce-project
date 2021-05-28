import React, {useState} from 'react';

import FormInput from '../form-input/form-input.component';
import CustomButton from '../custom-button/custom-button.component';

import { auth, createUserProfileDocument } from '../../firebase/firebase.utils';

import './sign-up.styles.scss';

const SignUp = () => {

    // const [displayName, setDisplayName] = useState('');
    // const [email, setEmail] = useState('');
    // const [password, setPassword] = useState('');
    // const [confirmPassword, setConfirmPassword] = useState('');
    const [state, setState] = useState({
        displayName: "",
        email: "",
        password: "",
        confirmPassword: ""
    })

    const handleSubmit = async event => {
        event.preventDefault();

        if (state.password !== state.confirmPassword) {
            alert("passwords don't match");
            return;
        }

        try {
            const { user } = await auth.createUserWithEmailAndPassword(
                state.email,
                state.password
            );

            await createUserProfileDocument(user, { displayName });


            // setDisplayName("")
            // setEmail("")
            // setPassword("")
            // setConfirmPassword("")
            setState({
                displayName: "",
                email: "",
                password: "",
                confirmPassword: ""
            })

        } catch (error) {
            console.error(error);
        }
  };

  const handleChange = event => {
    const { name, value } = event.target;
    setState(prevState => ({ ...prevState, [name]: value }));
  };

    return (
      <div className='sign-up'>
        <h2 className='title'>I do not have a account</h2>
        <span>Sign up with your email and password</span>
        <form className='sign-up-form' onSubmit={handleSubmit}>
          <FormInput
            type='text'
            name='displayName'
            value={displayName}
            onChange={handleChange}
            label='Display Name'
            required
          />
          <FormInput
            type='email'
            name='email'
            value={email}
            onChange={handleChange}
            label='Email'
            required
          />
          <FormInput
            type='password'
            name='password'
            value={password}
            onChange={handleChange}
            label='Password'
            required
          />
          <FormInput
            type='password'
            name='confirmPassword'
            value={confirmPassword}
            onChange={handleChange}
            label='Confirm Password'
            required
          />
          <CustomButton type='submit'>SIGN UP</CustomButton>
        </form>
      </div>
    );

}

export default SignUp;