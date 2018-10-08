From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Date: Mon, 08 Oct 2018 13:29:55 +0000
Subject: Re: [PATCH net-next] mt76x0: pci: fix set external PA I/O current
Message-Id: <20181008132954.GB15297@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539004909-195005-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539004909-195005-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>, Stanislaw Gruszka <sgruszka@redhat.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/mediatek/mt76/mt76x0/pci.c: In function 'mt76x0e_register_device':
> drivers/net/wireless/mediatek/mt76/mt76x0/pci.c:107:8: warning:
>  variable 'data' set but not used [-Wunused-but-set-variable]
> 
> It seems correct value to write is 'data'
> 
> Fixes: 2b2cb40bcd7d ("mt76x0: pci: add hw initialization at bootstrap")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
