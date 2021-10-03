import { render } from '@redwoodjs/testing/web'

import LandingPagePage from './LandingPagePage'

describe('LandingPagePage', () => {
  it('renders successfully', () => {
    expect(() => {
      render(<LandingPagePage />)
    }).not.toThrow()
  })
})
