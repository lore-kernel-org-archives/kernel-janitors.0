From: David Miller <davem@davemloft.net>
Date: Thu, 10 May 2018 21:53:58 +0000
Subject: Re: [PATCH][next] net: aquantia: fix unsigned numvecs comparison with less than zero
Message-Id: <20180510.175358.1296757435086922873.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510125201.19707-1-colin.king@canonical.com>
In-Reply-To: <20180510125201.19707-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: igor.russkikh@aquantia.com, pavel.belous@aquantia.com, weiyongjun1@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 10 May 2018 13:52:01 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The comparison of numvecs < 0 is always false because numvecs is a u32
> and hence the error return from a failed call to pci_alloc_irq_vectores
> is never detected.  Fix this by using the signed int ret to handle the
> error return and assign numvecs to err.
> 
> Detected by CoverityScan, CID#1468650 ("Unsigned compared against 0")
> 
> Fixes: a09bd81b5413 ("net: aquantia: Limit number of vectors to actually allocated irqs")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This doesn't apply to net-next.
