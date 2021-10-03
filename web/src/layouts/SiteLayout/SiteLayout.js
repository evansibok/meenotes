import { Link, routes } from '@redwoodjs/router'

const SiteLayout = ({ children }) => {
  return (
    <>
      <header className="site-header">
        <h1>Logo</h1>

        <nav className="site-nav">
          <ul>
            <li>
              <Link to={routes.register()}>Create Account</Link>
            </li>
            <li>
              <Link to={routes.login()}>Login</Link>
            </li>
          </ul>
        </nav>
      </header>

      <main>{children}</main>
    </>
  )
}

export default SiteLayout
