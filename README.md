# 🧪 BTCheck Tests — QA Automation Suite

Repositório dedicado à automação de testes do projeto [BTCheck](https://github.com/guibim/btcheck).  
Este ambiente foi criado para garantir a **qualidade, estabilidade e confiabilidade** do portal, validando desde as **APIs e integrações** até o **comportamento da interface**.

O projeto reúne **Robot Framework** e **Cypress**, unindo o melhor dos dois mundos: testes declarativos e legíveis com Robot, e execução rápida e moderna com Cypress.  

---

## 🎯 Objetivo do Projeto

O **BTCheck Tests** tem como foco demonstrar **boas práticas de QA moderno**, com cobertura completa e integração contínua.  
O objetivo é validar cada camada do sistema, garantindo que **dados, funcionalidades e experiência do usuário** se mantenham consistentes após cada atualização do portal.

---

## 🧩 Tipos de Teste Implementados

| Tipo | Ferramenta | Objetivo |
|------|-------------|-----------|
| **Smoke Tests** | Robot / Cypress | Validar rapidamente a disponibilidade e resposta das principais rotas e páginas. |
| **API Tests** | Robot Framework (RequestsLibrary) | Testar endpoints, contratos e códigos de status. |
| **E2E Tests (UI)** | Cypress / Robot (Browser) | Simular a jornada completa do usuário no portal. |
| **Integration Tests** | Robot Framework | Garantir integração entre scraping, banco de dados e geração de JSON. |
| **Unit Tests (keywords)** | Robot Framework | Validar regras internas e funções utilitárias de forma isolada. |

---

## ⚙️ Stack Técnica

**Linguagens:**  
- Python  
- JavaScript / TypeScript  

**Frameworks e Bibliotecas:**  
- [Robot Framework](https://robotframework.org/)  
  - Browser (Playwright)  
  - RequestsLibrary  
  - DatabaseLibrary  
  - JSONLibrary  
- [Cypress](https://www.cypress.io/)  
- [GitHub Actions](https://github.com/features/actions) para CI/CD  
- PostgreSQL (mock/testes de integração)

---


