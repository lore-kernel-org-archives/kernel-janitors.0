From: David Miller <davem@davemloft.net>
Date: Tue, 23 Jan 2018 16:00:06 +0000
Subject: Re: [PATCH net-next] net: aquantia: Fix error return code in aq_pci_probe()
Message-Id: <20180123.110006.212357313377754992.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516673446-170729-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516673446-170729-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: darcari@redhat.com, colin.king@canonical.com, vomlehn@texas.net, igor.russkikh@aquantia.com, pavel.belous@aquantia.com, Dmitrii.Tarakanov@aquantia.com, Alexander.Loktionov@aquantia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 23 Jan 2018 02:10:46 +0000

> Fix to return error code -ENOMEM from the aq_ndev_alloc() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 23ee07ad3c2f ("net: aquantia: Cleanup pci functions module")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
