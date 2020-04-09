import React from 'react'

import HeaderMobile from './HeaderMobile'
import Logo from './Logo'

const Header = () => (
  <header id='header'>
    <div className='not-mobile'>
      <h1 className='logo'>
        <a href='/'>
          <span className='logo-content' tabIndex='-1'>
              <img className={'img-logo'} src={'/images/css-logo.png'} alt={'css-logo'}/>
              <div>
                  <span>莞工网安学院</span>
                  <Logo />
              </div>
          </span>
        </a>
      </h1>
    </div>
    <HeaderMobile />
  </header>
)

export default Header
