# Agência de Solicitações

Sistema de gerenciamento de solicitações e clientes para agências, desenvolvido com tecnologias modernas e interface intuitiva.

## 🚀 Tecnologias Utilizadas

- **Frontend**: React + TypeScript
- **UI/UX**: shadcn-ui + Tailwind CSS
- **Build**: Vite
- **Gerenciamento de Estado**: Context API
- **Roteamento**: React Router

## ✨ Funcionalidades

- 📝 Gerenciamento de solicitações
- 👥 Cadastro e gestão de clientes
- 📅 Visualização em calendário
- 🔐 Sistema de autenticação
- 🎨 Interface responsiva e moderna
- 🌓 Modo claro/escuro

## 🛠️ Instalação e Execução

### 🖥️ Instalação Local (Desenvolvimento)

1. Clone o repositório:
```bash
git clone https://github.com/Esamwell/agenciasolicita.git
cd agenciasolicita
```

2. Instale as dependências:
```bash
npm install
```

3. Inicie o servidor de desenvolvimento:
```bash
npm run dev
```

4. Acesse a aplicação em `http://localhost:5173`

### 🌐 Instalação em Produção

Para instalar em um servidor Linux (Ubuntu/Debian), você pode usar o script de instalação automática:

1. Baixe o script de instalação:
```bash
wget https://raw.githubusercontent.com/Esamwell/agenciasolicita/main/install.sh
```

2. Torne o script executável:
```bash
chmod +x install.sh
```

3. Execute o script (como root):
```bash
sudo ./install.sh
```

O script irá:
- Instalar Node.js e Nginx
- Configurar o ambiente de produção
- Instalar e configurar PM2 para gerenciamento do processo
- Configurar SSL com Certbot
- Construir e implantar a aplicação

Após a instalação, o sistema estará disponível em `https://sistema.hubsa2.com.br`

> **Nota**: Antes de executar o script, certifique-se de:
> - Ter um domínio configurado apontando para o IP do servidor
> - Substituir `seu-email@exemplo.com` no script pelo seu email real
> - Ter acesso root ao servidor

## 📁 Estrutura do Projeto

```
agenciasolicita/
├── src/
│   ├── components/     # Componentes reutilizáveis
│   ├── context/        # Contextos da aplicação
│   ├── pages/          # Páginas da aplicação
│   ├── types/          # Definições de tipos TypeScript
│   └── lib/            # Utilitários e configurações
├── public/             # Arquivos estáticos
└── data/              # Dados da aplicação
```

## 🔒 Segurança

- Autenticação de usuários
- Gerenciamento seguro de senhas
- Proteção de rotas

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📞 Suporte

Para suporte, envie um email para [seu-email@exemplo.com] ou abra uma issue no GitHub.
