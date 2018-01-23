From: Igor Russkikh <igor.russkikh@aquantia.com>
Date: Tue, 23 Jan 2018 07:13:23 +0000
Subject: Re: [PATCH net-next] net: aquantia: make symbol hw_atl_boards static
Message-Id: <1c63d00f-b00f-750c-2ed2-71137dd5fbb6@aquantia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516673438-170662-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516673438-170662-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, David Arcari <darcari@redhat.com>, Colin Ian King <colin.king@canonical.com>, David VomLehn <vomlehn@texas.net>, Pavel Belous <pavel.belous@aquantia.com>, Dmitrii Tarakanov <Dmitrii.Tarakanov@aquantia.com>, Alexander Loktionov <Alexander.Loktionov@aquantia.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


Thanks, Wei!

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c:50:34: warning:
>  symbol 'hw_atl_boards' was not declared. Should it be static?
> 
> Fixes: 4948293ff963 ("net: aquantia: Introduce new AQC devices and capabilities")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Igor Russkikh <igor.russkikh@aquantia.com>
