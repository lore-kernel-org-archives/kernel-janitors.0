From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 28 Mar 2018 16:24:16 +0000
Subject: Re: [PATCH net-next] net: bcmgenet: return NULL instead of plain integer
Message-Id: <5D7A61BD-AABF-4660-A56B-4DC5BE71315C@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522241479-77691-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522241479-77691-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Doug Berger <opendmb@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On March 28, 2018 5:51:19 AM PDT, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>Fixes the following sparse warning:
>
>drivers/net/ethernet/broadcom/genet/bcmgenet.c:1351:16: warning:
> Using plain integer as NULL pointer
>
>Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

-- 
Florian
