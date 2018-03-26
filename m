From: Walter Harms <wharms@bfs.de>
Date: Mon, 26 Mar 2018 16:09:40 +0000
Subject: re:[PATCH] RDMA/hns: ensure for-loop actually iterates and free's buffers
Message-Id: <96950638.6063.1522080581233@ox-groupware.bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180326151018.21066-1-colin.king@canonical.com>
In-Reply-To: <20180326151018.21066-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>From: Colin Ian King <colin.king@canonical.com>
>
>The current for-loop zeros variable i and only loops once, hence
>not all the buffers are free'd.  Fix this by setting i correctly.

>Detected by CoverityScan, CID#1463415 ("Operands don't affect result")
>
>Fixes: a5073d6054f7 ("RDMA/hns: Add eq support of hip08")
>Signed-off-by: Colin Ian King <colin.king@canonical.com>
>---
> drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
>b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
>index 684c2d1a0ed0..8b84ab7800d8 100644
>--- a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
>+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
>@@ -4391,7 +4391,7 @@ static int hns_roce_mhop_alloc_eq(struct hns_roce_dev
>*hr_dev,
> 	eq->l0_dma = 0;
> 
> 	if (mhop_num = 1)
>-		for (i -= i; i >= 0; i--)
>+		for (i -= 1; i >= 0; i--)
> 			dma_free_coherent(dev, buf_chk_sz, eq->buf[i],
> 					  eq->buf_dma[i]);

the fix seems korrekt but it violates the rule of least surprise and
programmers are bad at counting backwards (as seen in many examples).
therefore i suggest:
 if (mhop_num = 1) {
        int n;
        for(n=0;n<i;n++)
             dma_free_coherent(dev, buf_chk_sz, eq->buf[n],eq->buf_dma[n]);
          }
IMHO this is more readable and bugs are more obvious.

hope that helps,
re,
 wh



> 	else if (mhop_num = 2) {
>-- 2.15.1 -- To unsubscribe from this list: send the line "unsubscribe
>kernel-janitors" in the body of a message to >majordomo@vger.kernel.org More
>majordomo info at http://vger.kernel.org/majordomo-info.html 
