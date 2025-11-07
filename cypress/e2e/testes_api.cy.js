describe('Validação das APIs do BTCheck', () => {
  it('Verifica status 200 e corpo', () => {
    cy.fixture('apis.json').then((data) => {
      // sanity checks da fixture
      expect(data).to.exist
      expect(data.apis).to.be.an('array').and.not.be.empty

      data.apis.forEach((api) => {
        cy.log(`Testando: ${api.name}`)
        cy.request(api.url).then((response) => {
          // STATUS
          expect(response.status, `${api.name} - status`).to.eq(200)
          expect(response.statusText, `${api.name} - statusText`).to.include('OK')

          // CORPO
          expect(response.body, `${api.name} - body`).to.exist
          expect(response.body, `${api.name} - tipo`).to.be.an('object')

          if (Array.isArray(api.expectedKeys)) {
            api.expectedKeys.forEach((k) => {
              expect(response.body, `${api.name} deve conter '${k}'`).to.have.property(k)
            })
          }
        })
      })
    })
  })
})
