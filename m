From: Igor Russkikh <igor.russkikh@aquantia.com>
Date: Tue, 23 Jan 2018 07:14:57 +0000
Subject: Re: [PATCH net-next] net: aquantia: Fix error return code in aq_pci_probe()
Message-Id: <b11fad59-2086-4b79-7c5d-aa74b487b5c0@aquantia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516673446-170729-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516673446-170729-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, David Arcari <darcari@redhat.com>, Colin Ian King <colin.king@canonical.com>, David VomLehn <vomlehn@texas.net>, Pavel Belous <pavel.belous@aquantia.com>, Dmitrii Tarakanov <Dmitrii.Tarakanov@aquantia.com>, Alexander Loktionov <Alexander.Loktionov@aquantia.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


> Fix to return error code -ENOMEM from the aq_ndev_alloc() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 23ee07ad3c2f ("net: aquantia: Cleanup pci functions module")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Igor Russkikh <igor.russkikh@aquantia.com>

