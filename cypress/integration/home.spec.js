describe('Jungle app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it ('display homepage correctly', () => {
    cy.get('.navbar').should('be.visible')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is two products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

});