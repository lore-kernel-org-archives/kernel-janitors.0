From: patchwork-bot+netdevbpf@kernel.org
Date: Wed, 16 Dec 2020 19:50:47 +0000
Subject: Re: [PATCH] net: allwinner: Fix some resources leak in the error handling path of the probe and in t
Message-Id: <160814824770.18857.16417410441229264372.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214202117.146293-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201214202117.146293-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: song.bao.hua@hisilicon.com, jernej.skrabec@siol.net, f.fainelli@gmail.com, leon@kernel.org, timur@kernel.org, netdev@vger.kernel.org, wangyunjian@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mripard@kernel.org, wens@csie.org, kuba@kernel.org, sr@denx.de, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Mon, 14 Dec 2020 21:21:17 +0100 you wrote:
> 'irq_of_parse_and_map()' should be balanced by a corresponding
> 'irq_dispose_mapping()' call. Otherwise, there is some resources leaks.
> 
> Add such a call in the error handling path of the probe function and in the
> remove function.
> 
> Fixes: 492205050d77 ("net: Add EMAC ethernet driver found on Allwinner A10 SoC's")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - net: allwinner: Fix some resources leak in the error handling path of the probe and in the remove function
    https://git.kernel.org/netdev/net/c/322e53d1e252

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
