import { Link, routes } from '@redwoodjs/router'
import { MetaTags } from '@redwoodjs/web'

const LandingPagePage = () => {
  return (
    <>
      <MetaTags
        title="LandingPage"
        // description="LandingPage description"
        /* you should un-comment description and add a unique description, 155 characters or less
      You can look at this documentation for best practices : https://developers.google.com/search/docs/advanced/appearance/good-titles-snippets */
      />

      <h1>LandingPagePage</h1>
      <p>
        Find me in{' '}
        <code>./web/src/pages/LandingPagePage/LandingPagePage.js</code>
      </p>
      <p>
        My default route is named <code>landingPage</code>, link to me with `
        <Link to={routes.landingPage()}>LandingPage</Link>`
      </p>
    </>
  )
}

export default LandingPagePage
