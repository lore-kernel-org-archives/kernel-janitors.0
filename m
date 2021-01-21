From: patchwork-bot+netdevbpf@kernel.org
Date: Thu, 21 Jan 2021 05:00:08 +0000
Subject: Re: [PATCH net-next] net: dsa: Fix off by one in dsa_loop_port_vlan_add()
Message-Id: <161120520818.24300.9003059059327075476.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAbyb5kBJQlpYCs2@mwanda>
In-Reply-To: <YAbyb5kBJQlpYCs2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: f.fainelli@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, olteanv@gmail.com, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 19 Jan 2021 17:53:35 +0300 you wrote:
> The > comparison is intended to be >= to prevent reading beyond the
> end of the ps->vlans[] array.  It doesn't affect run time though because
> the ps->vlans[] array has VLAN_N_VID (4096) elements and the vlan->vid
> cannot be > 4094 because it is checked earlier.
> 
> Fixes: 98cd1552ea27 ("net: dsa: Mock-up driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: dsa: Fix off by one in dsa_loop_port_vlan_add()
    https://git.kernel.org/netdev/net-next/c/646188c9550f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
