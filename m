From: patchwork-bot+netdevbpf@kernel.org
Date: Fri, 15 Jan 2021 01:30:11 +0000
Subject: Re: [PATCH] mlxsw: pci: switch from 'pci_' to 'dma_' API
Message-Id: <161067421177.20666.5506474617106384086.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210114084757.490540-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210114084757.490540-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jiri@nvidia.com, idosch@nvidia.com, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 14 Jan 2021 09:47:57 +0100 you wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'mlxsw_pci_queue_init()' and
> 'mlxsw_pci_fw_area_init()' GFP_KERNEL can be used because both functions
> are already using this flag and no lock is acquired.
> 
> [...]

Here is the summary with links:
  - mlxsw: pci: switch from 'pci_' to 'dma_' API
    https://git.kernel.org/netdev/net-next/c/bb5c64c879e5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
