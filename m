From: patchwork-bot+netdevbpf@kernel.org
Date: Wed, 16 Dec 2020 19:10:06 +0000
Subject: Re: [PATCH] net: bcmgenet: Fix a resource leak in an error handling path in the probe functin
Message-Id: <160814580681.32605.12840907282791661711.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212182005.120437-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212182005.120437-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: opendmb@gmail.com, f.fainelli@gmail.com, davem@davemloft.net, kuba@kernel.org, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sat, 12 Dec 2020 19:20:05 +0100 you wrote:
> If the 'register_netdev()' call fails, we must undo a previous
> 'bcmgenet_mii_init()' call.
> 
> Fixes: 1c1008c793fa ("net: bcmgenet: add main driver file")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The missing 'bcmgenet_mii_exit()' call is added here, instead of in the
> error handling path in order to avoid some goto spaghetti code.
> 
> [...]

Here is the summary with links:
  - net: bcmgenet: Fix a resource leak in an error handling path in the probe functin
    https://git.kernel.org/netdev/net/c/4375ada01963

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
