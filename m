From: patchwork-bot+netdevbpf@kernel.org
Date: Mon, 15 Feb 2021 20:50:07 +0000
Subject: Re: [PATCH] b43: N-PHY: Fix the update of coef for the PHY revision >= 3case
Message-Id: <161342220742.9745.8382671351408094694.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210215120532.76889-1-colin.king@canonical.com>
In-Reply-To: <20210215120532.76889-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, zajec5@gmail.com, linville@tuxdriver.com, linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Mon, 15 Feb 2021 12:05:32 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The documentation for the PHY update [1] states:
> 
> Loop 4 times with index i
> 
>     If PHY Revision >= 3
>         Copy table[i] to coef[i]
>     Otherwise
>         Set coef[i] to 0
> 
> [...]

Here is the summary with links:
  - b43: N-PHY: Fix the update of coef for the PHY revision >= 3case
    https://git.kernel.org/netdev/net/c/4773acf3d4b5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
