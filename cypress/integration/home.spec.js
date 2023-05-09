
describe('jungle app', () => {
  it('displays the home page', () => {
    cy.visit('/').contains('Looking for a way to add some life to your home?');
  })

  it("displays products on the page", () => {
    cy.get(".products article").should("be.visible");
  })

  it("loads 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
})
