From: patchwork-bot+netdevbpf@kernel.org
Date: Fri, 20 Nov 2020 19:10:07 +0000
Subject: Re: [PATCH][next] octeontx2-af: Fix return of uninitialized variable err
Message-Id: <160589940700.22082.1258915221742899209.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118132502.461098-1-colin.king@canonical.com>
In-Reply-To: <20201118132502.461098-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, davem@davemloft.net, kuba@kernel.org, naveenm@marvell.com, vattunuru@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 18 Nov 2020 13:25:02 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the variable err may be uninitialized if several of the if
> statements are not executed in function nix_tx_vtag_decfg and a garbage
> value in err is returned.  Fix this by initialized ret at the start of
> the function.
> 
> [...]

Here is the summary with links:
  - [next] octeontx2-af: Fix return of uninitialized variable err
    https://git.kernel.org/netdev/net-next/c/dd6028a3cb5d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
