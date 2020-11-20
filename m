From: patchwork-bot+netdevbpf@kernel.org
Date: Fri, 20 Nov 2020 19:10:07 +0000
Subject: Re: [PATCH][next] octeontx2-af: Fix access of iter->entry after iter object has been kfree'd
Message-Id: <160589940705.22082.10268101858431094788.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118143803.463297-1-colin.king@canonical.com>
In-Reply-To: <20201118143803.463297-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, davem@davemloft.net, kuba@kernel.org, naveenm@marvell.com, sbhatta@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 18 Nov 2020 14:38:03 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to pc_delete_flow can kfree the iter object, so the following
> dev_err message that accesses iter->entry can accessmemory that has
> just been kfree'd.  Fix this by adding a temporary variable 'entry'
> that has a copy of iter->entry and also use this when indexing into
> the array mcam->entry2target_pffunc[]. Also print the unsigned value
> using the %u format specifier rather than %d.
> 
> [...]

Here is the summary with links:
  - [next] octeontx2-af: Fix access of iter->entry after iter object has been kfree'd
    https://git.kernel.org/netdev/net-next/c/76483980174c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
