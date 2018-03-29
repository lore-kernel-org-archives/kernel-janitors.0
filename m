From: David Miller <davem@davemloft.net>
Date: Thu, 29 Mar 2018 18:36:04 +0000
Subject: Re: [PATCH net-next] net: bcmgenet: return NULL instead of plain integer
Message-Id: <20180329.143604.838663645215851163.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522241479-77691-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522241479-77691-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: opendmb@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 12:51:19 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/broadcom/genet/bcmgenet.c:1351:16: warning:
>  Using plain integer as NULL pointer
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
