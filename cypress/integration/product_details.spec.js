
beforeEach(() => {
  cy.visit('/')
})


describe ('test that users can navigate', () => {

  it ('nav to product details',  () => {
    //fin the product partial on the home page and click on the item
    cy.get(".products article").first().click();

    //should match the product url
    cy.url().should('include', '/products/')
  })



}) 