From: patchwork-bot+netdevbpf@kernel.org
Date: Thu, 17 Dec 2020 19:00:07 +0000
Subject: Re: [PATCH net] qlcnic: Fix error code in probe
Message-Id: <160823160779.4885.3716002123828693484.git-patchwork-notify@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9nHbMqEyI/xPfGd@mwanda>
In-Reply-To: <X9nHbMqEyI/xPfGd@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: shshaikh@marvell.com, sony.chacko@qlogic.com, manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, davem@davemloft.net, kuba@kernel.org, sucheta.chakraborty@qlogic.com, sritej.velaga@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Wed, 16 Dec 2020 11:38:04 +0300 you wrote:
> Return -EINVAL if we can't find the correct device.  Currently it
> returns success.
> 
> Fixes: 13159183ec7a ("qlcnic: 83xx base driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [net] qlcnic: Fix error code in probe
    https://git.kernel.org/netdev/net/c/0d52848632a3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
