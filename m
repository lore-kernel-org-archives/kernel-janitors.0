From: David Miller <davem@davemloft.net>
Date: Tue, 29 Oct 2019 23:16:26 +0000
Subject: Re: [PATCH -next] net: aquantia: make two symbols be static
Message-Id: <20191029.161626.1023293284198194402.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191026020738.130606-1-maowenan@huawei.com>
In-Reply-To: <20191026020738.130606-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: epomozov@marvell.com, igor.russkikh@aquantia.com, pavel.belous@aquantia.com, dmitry.bezrukov@aquantia.com, dmitry.bogdanov@aquantia.com, ndanilov@aquantia.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Sat, 26 Oct 2019 10:07:38 +0800

> When using ARCH=mips CROSS_COMPILE=mips-linux-gnu-
> to build drivers/net/ethernet/aquantia/atlantic/aq_ptp.o
> and drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.o,
> below errors can be seen:
> drivers/net/ethernet/aquantia/atlantic/aq_ptp.c:1378:6:
> warning: symbol 'aq_ptp_poll_sync_work_cb' was not declared.
> Should it be static?
> 
> drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c:1155:5:
> warning: symbol 'hw_atl_b0_ts_to_sys_clock' was not declared.
> Should it be static?
> 
> This patch to make aq_ptp_poll_sync_work_cb and hw_atl_b0_ts_to_sys_clock
> be static to fix these warnings.
> 
> Fixes: 9c477032f7d0 ("net: aquantia: add support for PIN funcs")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied.
