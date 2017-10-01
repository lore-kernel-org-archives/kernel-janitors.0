From: David Miller <davem@davemloft.net>
Date: Sun, 01 Oct 2017 03:13:06 +0000
Subject: Re: [PATCH] net: hns3: fix null pointer dereference before null check
Message-Id: <20171001.041306.1619218334938501775.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170929195123.4189-1-colin.king@canonical.com>
In-Reply-To: <20170929195123.4189-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 29 Sep 2017 20:51:23 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> pointer ndev is being dereferenced with the call to netif_running
> before it is being null checked.  Re-order the code to only dereference
> ndev after it has been null checked.
> 
> Detected by CoverityScan, CID#1457206 ("Dereference before null check")
> 
> Fixes: 9df8f79a4d29 ("net: hns3: Add DCB support when interacting with network stack")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
