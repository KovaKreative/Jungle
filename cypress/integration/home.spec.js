/// <reference types="cypress" />

// Welcome to Cypress!
//
// This spec file contains a variety of sample tests
// for a todo list app that are designed to demonstrate
// the power of writing tests in Cypress.
//
// To learn more about how Cypress works and
// what makes it such an awesome testing tool,
// please read our getting started guide:
// https://on.cypress.io/introduction-to-cypress

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
