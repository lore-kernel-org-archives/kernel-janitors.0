From: Igor Russkikh <igor.russkikh@aquantia.com>
Date: Thu, 10 May 2018 15:36:20 +0000
Subject: Re: [PATCH][next] net: aquantia: fix unsigned numvecs comparison with less than zero
Message-Id: <e0d3695f-89cf-f1c6-6284-f244fa58ba64@aquantia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510125201.19707-1-colin.king@canonical.com>
In-Reply-To: <20180510125201.19707-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Pavel Belous <pavel.belous@aquantia.com>, Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Thanks, Colin!

> The comparison of numvecs < 0 is always false because numvecs is a u32
> and hence the error return from a failed call to pci_alloc_irq_vectores
> is never detected.  Fix this by using the signed int ret to handle the
> error return and assign numvecs to err.
> 
> Detected by CoverityScan, CID#1468650 ("Unsigned compared against 0")
> 
> Fixes: a09bd81b5413 ("net: aquantia: Limit number of vectors to actually allocated irqs")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: Igor Russkikh <igor.russkikh@aquantia.com>
