From: David Miller <davem@davemloft.net>
Date: Thu, 07 Nov 2019 05:24:41 +0000
Subject: Re: [PATCH net-next] net: axienet: Fix error return code in axienet_probe()
Message-Id: <20191106.212441.931590542340055489.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106155449.107672-1-weiyongjun1@huawei.com>
In-Reply-To: <20191106155449.107672-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@xilinx.com, kernel-janitors@vger.kernel.org, michal.simek@xilinx.com, linux@armlinux.org.uk, hancock@sedsystems.ca, linux-arm-kernel@lists.infradead.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 6 Nov 2019 15:54:49 +0000

> In the DMA memory resource get failed case, the error is not
> set and 0 will be returned. Fix it by reove redundant check
> since devm_ioremap_resource() will handle it.
> 
> Fixes: 28ef9ebdb64c ("net: axienet: make use of axistream-connected attribute optional")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Fixed with the commit message typo fixed.
