From: patchwork-bot+netdevbpf@kernel.org
Date: Tue, 24 Nov 2020 01:10:05 +0000
Subject: Re: [PATCH 1/2] net: pch_gbe: Use dma_set_mask_and_coherent to simplify code
Message-Id: <160618020532.30283.4433703176583925818.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201121090302.1332491-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201121090302.1332491-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, kuba@kernel.org, kaixuxia@tencent.com, mhabets@solarflare.com, mst@redhat.com, luc.vanoostenryck@gmail.com, jesse.brandeburg@intel.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Sat, 21 Nov 2020 10:03:02 +0100 you wrote:
> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

Here is the summary with links:
  - [1/2] net: pch_gbe: Use dma_set_mask_and_coherent to simplify code
    https://git.kernel.org/netdev/net-next/c/8ff39301efd9
  - [2/2] net: pch_gbe: Use 'dma_free_coherent()' to undo 'dma_alloc_coherent()'
    https://git.kernel.org/netdev/net-next/c/7fd6372e273e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
