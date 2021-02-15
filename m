From: patchwork-bot+netdevbpf@kernel.org
Date: Mon, 15 Feb 2021 23:20:09 +0000
Subject: Re: [PATCH] i40e: Fix incorrect use of ip6src due to copy-paste coding error
Message-Id: <161343120902.10830.1258291646017278044.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210215161923.83682-1-colin.king@canonical.com>
In-Reply-To: <20210215161923.83682-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com, davem@davemloft.net, kuba@kernel.org, przemyslawx.patynowski@intel.com, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Mon, 15 Feb 2021 16:19:23 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> It appears that the call of ipv6_add_any for the destination address
> is using ip6src instead of ip6dst, this looks like a copy-paste
> coding error. Fix this by replacing ip6src with ip6dst.
> 
> Addresses-Coverity: ("Copy-paste error")
> Fixes: efca91e89b67 ("i40e: Add flow director support for IPv6")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - i40e: Fix incorrect use of ip6src due to copy-paste coding error
    https://git.kernel.org/netdev/net-next/c/7f76963b692d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
