import { Link, routes } from '@redwoodjs/router'
import { MetaTags } from '@redwoodjs/web'

const RegisterPage = () => {
  return (
    <>
      <MetaTags
        title="Register"
        description="Create your account to begin using MeeNotes"
      />

      <h1>RegisterPage</h1>
      <Link to={routes.login()}>Login Here</Link>
    </>
  )
}

export default RegisterPage
