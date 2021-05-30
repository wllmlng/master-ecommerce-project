import React, {useState, useEffect} from 'react';
import { Switch, Route, Redirect } from 'react-router-dom';

import './App.css';

import HomePage from './pages/homepage/homepage.component';
import ShopPage from './pages/shop/shop.component';
import SignInAndSignUpPage from './pages/sign-in-and-sign-up/sign-in-and-sign-up.component';
import Header from './components/header/header.component';
import {auth, createUserProfileDocument} from './firebase/firebase.utils';

function App(props) {

  const [currentUser, setCurrentUser] = useState({});


  let unsubscribeFromAuth = null;

  useEffect(() =>{
    unsubscribeFromAuth = auth.onAuthStateChanged(async userAuth=>{
      // setCurrentUser(user)
      if(userAuth){
        const userRef = await createUserProfileDocument(userAuth);

        userRef.onSnapshot(snapShot=>{
          setCurrentUser({
            id: snapShot.id,
            ...snapShot.data()
          })
        })

      }else{
        setCurrentUser(userAuth)
      }
    })

    return unsubscribeFromAuth;

  },[])
  
  return (
    <div>
      {console.log('state', currentUser)}
      <Header currentUser={currentUser}/>
      <Switch>
        <Route exact path='/' component={HomePage} />
        <Route path='/shop' component={ShopPage} />
        <Route path='/signin' 
          // component={SignInAndSignUpPage} 
          render={() =>
            props.currentUser ? (
              <Redirect to='/' />
            ) : (
              <SignInAndSignUpPage />
            )
          }
        />
      </Switch>
    </div>
  );
}

export default App;
