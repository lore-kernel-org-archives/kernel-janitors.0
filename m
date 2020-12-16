From: patchwork-bot+netdevbpf@kernel.org
Date: Wed, 16 Dec 2020 19:20:07 +0000
Subject: Re: [PATCH] net: mscc: ocelot: Fix a resource leak in the error handling path of the probe function
Message-Id: <160814640705.4483.2350966398303153186.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201213114838.126922-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201213114838.126922-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: UNGLinuxDriver@microchip.com, vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com, davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sun, 13 Dec 2020 12:48:38 +0100 you wrote:
> In case of error after calling 'ocelot_init()', it must be undone by a
> corresponding 'ocelot_deinit()' call, as already done in the remove
> function.
> 
> Fixes: a556c76adc05 ("net: mscc: Add initial Ocelot switch support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - net: mscc: ocelot: Fix a resource leak in the error handling path of the probe function
    https://git.kernel.org/netdev/net/c/f87675b836b3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
