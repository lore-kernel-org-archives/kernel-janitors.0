From: David Miller <davem@davemloft.net>
Date: Tue, 23 Jan 2018 15:59:58 +0000
Subject: Re: [PATCH net-next] net: aquantia: make symbol hw_atl_boards static
Message-Id: <20180123.105958.1725862517855125272.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516673438-170662-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516673438-170662-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: darcari@redhat.com, colin.king@canonical.com, vomlehn@texas.net, igor.russkikh@aquantia.com, pavel.belous@aquantia.com, Dmitrii.Tarakanov@aquantia.com, Alexander.Loktionov@aquantia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 23 Jan 2018 02:10:38 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c:50:34: warning:
>  symbol 'hw_atl_boards' was not declared. Should it be static?
> 
> Fixes: 4948293ff963 ("net: aquantia: Introduce new AQC devices and capabilities")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
