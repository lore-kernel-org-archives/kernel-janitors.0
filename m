From: patchwork-bot+netdevbpf@kernel.org
Date: Tue, 01 Dec 2020 21:00:06 +0000
Subject: Re: [PATCH] net/ipv6: propagate user pointer annotation
Message-Id: <160685640652.20133.12792277369637209995.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201127093421.21673-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201127093421.21673-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: hch@lst.de, davem@davemloft.net, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 27 Nov 2020 10:34:21 +0100 you wrote:
> For IPV6_2292PKTOPTIONS, do_ipv6_getsockopt() stores the user pointer
> optval in the msg_control field of the msghdr.
> 
> Hence, sparse rightfully warns at ./net/ipv6/ipv6_sockglue.c:1151:33:
> 
>   warning: incorrect type in assignment (different address spaces)
>       expected void *msg_control
>       got char [noderef] __user *optval
> 
> [...]

Here is the summary with links:
  - net/ipv6: propagate user pointer annotation
    https://git.kernel.org/netdev/net-next/c/9e39394faef6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
