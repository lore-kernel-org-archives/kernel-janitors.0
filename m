From: David Miller <davem@davemloft.net>
Date: Fri, 22 Nov 2019 03:30:54 +0000
Subject: Re: [PATCH -next] enetc: make enetc_setup_tc_mqprio static
Message-Id: <20191121.193054.799887281860873787.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191122025240.8226-1-maowenan@huawei.com>
In-Reply-To: <20191122025240.8226-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, po.liu@nxp.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Fri, 22 Nov 2019 10:52:40 +0800

> While using ARCH=mips CROSS_COMPILE=mips-linux-gnu- command to compile,
> make C=2 drivers/net/ethernet/freescale/enetc/enetc.o
> 
> one warning can be found:
> drivers/net/ethernet/freescale/enetc/enetc.c:1439:5:
> warning: symbol 'enetc_setup_tc_mqprio' was not declared.
> Should it be static?
> 
> This patch make symbol enetc_setup_tc_mqprio static.
> Fixes: 34c6adf1977b ("enetc: Configure the Time-Aware Scheduler via tc-taprio offload")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied.
