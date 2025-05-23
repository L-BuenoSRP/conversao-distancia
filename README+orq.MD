https://www.hostinger.com.br/tutoriais/docker-cheat-sheet?utm_campaign=Generic-Tutorials-DSA|NT:Se|LO:BR-t4&utm_medium=ppc&gad_source=1&gclid=CjwKCAiA5eC9BhAuEiwA3CKwQp_XeoPprSnpz3w_SIrnn4nI6ojU6g2NqcSQ8as4E0Tw_U67mVC1fhoCF7cQAvD_BwE

## Estrutura do Projeto
- **POR.Siop.OrquestradorTrato.Api**: Contém a API do projeto.
- **POR.Siop.OrquestradorTrato.Comum**: Contém funcionalidades comuns utilizadas em todo o projeto.
- **POR.Siop.OrquestradorTrato.DTO**: Contém os Data Transfer Objects (DTOs) utilizados no projeto.
- **POR.Siop.OrquestradorTrato.ExternalServices**: Contém serviços externos utilizados pelo projeto.
- **POR.Siop.OrquestradorTrato.Services**: Contém os serviços principais do projeto.
- **POR.Siop.OrquestradorTrato.Tests**: Contém os testes do projeto.

## Pré-requisitos
- [.NET Core SDK](https://dotnet.microsoft.com/download)
- [Podman](https://podman.io/getting-started/installation)

## Como Construir o Projeto
Para construir o projeto, execute o seguinte comando:

```sh
dotnet build POR.Siop.OrquestradorTrato.sln
```


## Como Gerar a Imagem do Container
Para gerar a imagem do container, utilize o seguinte comando:

<span styles="width:100%;background" id="build-command">
  podman build -t orquestrador .
</span>

<button onclick="copyToClipboard('build-command')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>

## Como Rodar o Container
Para rodar o container com a imagem gerada, utilize o seguinte comando:

<span styles="width:100%;background" id="run-command">podman run orquestrador</span>
<button onclick="copyToClipboard('run-command')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>

## Como Rodar o Container com Mapeamento de Porta Aleatória
Para rodar o container com a imagem gerada, com o mapeamento de porta de forma aleatória do container para a máquina hospedeira, utilize o seguinte comando:

<span styles="width:100%;background" id="run-command-P">podman run -P orquestrador</span>

<button onclick="copyToClipboard('run-command-P')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>

## Como Rodar o Container com Mapeamento de Porta
Para rodar o container com a imagem gerada, 
com o mapeamento de porta de forma específica do container 
para a máquina hospedeira, utilize o seguinte comando:<br>
Sendo a porta à esquerda a  da maquina hospedeira e a direita do container
<span styles="width:100%;background" id="run-command-p">
podman run -p 58794:58794 orquestrador
</span>

<button onclick="copyToClipboard('run-command-p')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>

## Como Gerar a Imagem do Container para subir em repositorio do docker hub
Para gerar a imagem que em seguida será usada para dar push
<span styles="width:100%;background" id="run-command-build-for-hub">
podman build -t user/orquestrador:1.0 .
</span>

<button onclick="copyToClipboard('run-command-build-for-hub')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>

Sendo user o nome do usuario utilizado no docker hub, o nome apos a barra deve ser igual ao nome dado no repositorio criado no docker hub, e posteriormente a versão que será feito o upload.




Para fazer o login no docker hub, é necessário ter uma conta, gerar um access token na aba de segurança e rodar o comando abaixo
Deve ser configurado o container registry a ser usado, que seria o docker hub
<span styles="width:100%;background" id="run-command-login">
podman login -u user
</span>

<button onclick="copyToClipboard('run-command-login')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>


## Como fazer upload da imagem no docker hub
Para subir a imagem no docker hub para que possa utilizar posteriormente
<span styles="width:100%;background" id="run-command-upload-hub">
podman push user/orquestrador:1.0
</span>

<button onclick="copyToClipboard('run-command-upload-hub')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>

## Como fazer o build do container em usando uma arquitetura especifica
Pode ser inserido qual a plataforma será feito o build ao qual a imagem será subida
<span styles="width:100%;background" id="run-command-build-platform">
podman build --platform  linux/amd64 -t user/orquestrador:1.0
</span>

<button onclick="copyToClipboard('run-command-build-platform')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>

```sh
"In Docker, you can specify the architecture for your images using the --platform flag. The common architecture values you can use include:"
```

<!-- ```sh
linux/amd64
```

```sh
linux/arm64
```

```sh
linux/arm/v7
```

```sh
shlinux/arm/v6
```

```sh
shlinux/386
```

```sh
shlinux/ppc64le
```

```sh
shlinux/s390x
```

```sh
shwindows/amd64
``` -->
<br/>

>**Plataformas:**
>**linux/amd64:** Arquitetura x86-64 (64 bits) para Linux. <br/><br/>
>**linux/arm64:** Arquitetura ARM64 (64 bits) para Linux. <br/><br/>
>**linux/arm/v7:** Arquitetura ARMv7 (32 bits) para Linux. <br/><br/>
>**windows/amd64:** Arquitetura x86-64 (64 bits) para Windows. <br/><br/>
>**windows/arm64:** Arquitetura ARM64 (64 bits) para Windows. <br/><br/>
>**darwin/amd64:** Arquitetura x86-64 (64 bits) para macOS. <br/><br/>
>**darwin/arm64:** Arquitetura ARM64 (64 bits) para macOS (Apple Silicon).
<br/><br/>

## Como criar tags para marcar versões especificas da imagem
Pode ser criado uma tag para cenarios de uma arquitetura diferente ou alguma variação do build, deve ser usado antes de fazer o push, isso fara com que uma outra versão não seja sobrescrita, ao dar push, deve ser usado o nome definido na tag, o parametro mais a esquerda é o nome da imagem a qual foi feita o build, a mais a direita é o nome da tag
<span styles="width:100%;background" id="run-command-tag">
podman tag user/orquestrador:1.0 user/orquestrador:1.0-arm64
</span>

<button onclick="copyToClipboard('run-command-build-platform')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>


## Executar um compose de uma aplicação com varios containers
É o comando usado para iniciar um compose contendo diversos containers ja predefinidos, juntamente com definições de network entre os containers para comunicação interna
<span styles="width:100%;background" id="run-command-compose">
podman compose --project-name siop up -d
</span>

<button onclick="copyToClipboard('run-command-compose')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>

## Inspecionar informações de uma imagem de um repositorio(sem ter baixado)
Comando para buscar informações das imagens em repositorio sem precisar baixa-los, o trecho apos o comando do manifesto, insere em arquivo todos os dados buscados(json) `> manifest_output.txt`
<span styles="width:100%;background" id="run-command-inspect-manifest">
docker manifest inspect -v  mcr.microsoft.com/dotnet/framework/runtime:4.8 > manifest_output.txt
</span>

<button onclick="copyToClipboard('run-command-inspect-manifest')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>


## Inspecionar informações de uma imagem local
Comando para buscar informações das imagens baixadas, o trecho apos o comando do manifesto, insere em arquivo todos os dados buscados(json) `> manifest_output.txt`
<span styles="width:100%;background" id="run-command-inspect-image">
docker image inspect dev-container-aws-terraform-aws-dev > manifest_output.txt
</span>

<button onclick="copyToClipboard('run-command-inspect-image')">
<img  src="https://img.shields.io/badge/copiar%20comando-clipboard-blue">
</button>

<style>

span {
  display: block;
  font-family: monospace;
  padding: 18px 15px;
  background-color:hsl(0, 0.00%, 16.10%);
  border-radius: 3px;
  border: 1px solid none;
  font-family: 'Arial', sans-serif;
}
button {
  margin: 0px;
  padding: 0px;
  background-color:transparent;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
button:hover {
  background-color: #005f99;
}
</style>
</style>
<script>
function copyToClipboard(elementId) {
  const text = document.getElementById(elementId).innerText;
  navigator.clipboard.writeText(text).then(function() {
    alert('Comando copiado para a área de transferência');
  }, function(err) {
    console.error('Erro ao copiar o comando: ', err);
  });
}
</script>