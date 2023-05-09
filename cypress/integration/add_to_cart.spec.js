
describe('product add to cart page', () => {
  it('loads the home page and clicks on one of the products', () => {
    cy.visit('/').get(".products article").first().click();
    cy.get(".btn").contains("Add").click();
    cy.get(".nav-item").contains("My Cart (1)").should("be.visible");
  })
  
})
