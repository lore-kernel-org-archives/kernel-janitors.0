From: David Miller <davem@davemloft.net>
Date: Sat, 01 Dec 2018 01:24:14 +0000
Subject: Re: [PATCH net-next] net: qualcomm: rmnet: Remove set but not used variable 'cmd'
Message-Id: <20181130.172414.113123648892933050.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543458992-103568-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543458992-103568-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: subashab@codeaurora.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 29 Nov 2018 02:36:32 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c: In function 'rmnet_map_do_flow_control':
> drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c:23:36: warning:
>  variable 'cmd' set but not used [-Wunused-but-set-variable]
>   struct rmnet_map_control_command *cmd;
> 
> 'cmd' not used anymore now, should also be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
