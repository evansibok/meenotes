import { Link, routes } from '@redwoodjs/router'
import { MetaTags } from '@redwoodjs/web'

const LoginPage = () => {
  return (
    <>
      <MetaTags title="Login" description="Sign In to MeeNotes" />

      <h1>LoginPage</h1>
      <Link to={routes.register()}>Register Here</Link>
    </>
  )
}

export default LoginPage
