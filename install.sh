#!/bin/bash

echo "🚀 Iniciando instalação do Sistema de Agência..."

# Atualizar sistema
echo "📦 Atualizando o sistema..."
apt update && apt upgrade -y

# Instalar dependências
echo "📦 Instalando Node.js, Nginx e Certbot..."
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs nginx certbot python3-certbot-nginx

# Instalar PM2 globalmente
echo "📦 Instalando PM2..."
npm install -g pm2

# Configurar diretório da aplicação
echo "📁 Configurando diretórios..."
mkdir -p /var/www/sistema.hubsa2.com.br
cd /var/www/sistema.hubsa2.com.br

# Clonar o repositório
echo "📥 Clonando o repositório..."
git clone https://github.com/Esamwell/agenciasolicita.git .
#cd /var/www/sistema.hubsa2.com.br

# Instalar dependências do projeto
echo "📦 Instalando dependências do projeto..."
npm install

# Build do projeto
echo "🔨 Construindo o projeto..."
npm run build

# Configurar Nginx
echo "🔧 Configurando Nginx..."
cat > /etc/nginx/sites-available/sistema.hubsa2.com.br << 'EOF'
server {
    listen 80;
    server_name sistema.hubsa2.com.br;

    root /var/www/sistema.hubsa2.com.br/dist;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location /api {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

# Ativar o site no Nginx
ln -sf /etc/nginx/sites-available/sistema.hubsa2.com.br /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Testar configuração do Nginx
nginx -t

# Reiniciar Nginx
systemctl restart nginx

# Configurar PM2
echo "🔧 Configurando PM2..."
cat > ecosystem.config.js << 'EOF'
module.exports = {
  apps: [{
    name: 'agenciasolicita',
    script: 'npm',
    args: 'start',
    env: {
      NODE_ENV: 'production',
      PORT: 3000
    }
  }]
}
EOF

# Iniciar aplicação com PM2
pm2 start ecosystem.config.js
pm2 save
pm2 startup systemd -u $USER --hp $(eval echo ~$USER)

# Instalar e configurar Certbot para SSL
echo "🔒 Configurando SSL..."
certbot --nginx -d sistema.hubsa2.com.br --non-interactive --agree-tos --email seu-email@exemplo.com

echo "✅ Instalação concluída!"
echo "🌐 Acesse seu sistema em: https://sistema.hubsa2.com.br"
