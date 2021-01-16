From: patchwork-bot+netdevbpf@kernel.org
Date: Sat, 16 Jan 2021 00:50:08 +0000
Subject: Re: [PATCH] netxen_nic: switch from 'pci_' to 'dma_' API
Message-Id: <161075820887.2945.292036690452256996.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210113202519.487672-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210113202519.487672-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: manishc@marvell.com, rahulv@marvell.com, GR-Linux-NIC-Dev@marvell.com, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 13 Jan 2021 21:25:18 +0100 you wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'netxen_get_minidump_template()' GFP_KERNEL can
> be used because its only caller, ' netxen_setup_minidump(()' already uses
> it and no lock is acquired in the between.
> 
> [...]

Here is the summary with links:
  - netxen_nic: switch from 'pci_' to 'dma_' API
    https://git.kernel.org/netdev/net-next/c/297af515d75f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
