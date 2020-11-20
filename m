From: patchwork-bot+netdevbpf@kernel.org
Date: Fri, 20 Nov 2020 19:10:06 +0000
Subject: Re: [PATCH][next] octeontx2-pf: Fix unintentional sign extension issue
Message-Id: <160589940695.22082.5686784886721691946.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118130520.460365-1-colin.king@canonical.com>
In-Reply-To: <20201118130520.460365-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com, hkelam@marvell.com, davem@davemloft.net, kuba@kernel.org, naveenm@marvell.com, tduszynski@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 18 Nov 2020 13:05:20 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shifting of the u16 result from ntohs(proto) by 16 bits to the
> left will be promoted to a 32 bit signed int and then sign-extended
> to a u64.  In the event that the top bit of the return from ntohs(proto)
> is set then all then all the upper 32 bits of a 64 bit long end up as
> also being set because of the sign-extension. Fix this by casting to
> a u64 long before the shift.
> 
> [...]

Here is the summary with links:
  - [next] octeontx2-pf: Fix unintentional sign extension issue
    https://git.kernel.org/netdev/net-next/c/583b273dea75

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
