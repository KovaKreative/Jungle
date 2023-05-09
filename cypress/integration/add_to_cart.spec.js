
describe('product add to cart page', () => {
  it('loads the home page and clicks on one of the products', () => {
    cy.visit('/').get(".products article").first().click();
  })
  
})
