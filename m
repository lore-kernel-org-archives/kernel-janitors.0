From: DingXiang <dingxiang@huawei.com>
Date: Thu, 02 Jul 2015 09:19:37 +0000
Subject: [PATCH] Staging:dgnc:remove unused code
Message-Id: <1435828777-24181-1-git-send-email-dingxiang@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Because precompiled directive "#if 1" exist,so the "#else" part
will never be compiled,so remove it.

Signed-off-by: DingXiang <dingxiang@huawei.com>
---
 dgnc_neo.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/dgnc_neo.c b/dgnc_neo.c
index 1e583c2..8e85909 100644
--- a/dgnc_neo.c
+++ b/dgnc_neo.c
@@ -102,11 +102,7 @@ static inline void neo_set_cts_flow_control(struct channel_t *ch)
 
 
 	/* Turn on auto CTS flow control */
-#if 1
 	ier |= UART_17158_IER_CTSDSR;
-#else
-	ier &= ~(UART_17158_IER_CTSDSR);
-#endif
 
 	efr |= (UART_17158_EFR_ECB | UART_17158_EFR_CTSDSR);
 
@@ -138,11 +134,8 @@ static inline void neo_set_rts_flow_control(struct channel_t *ch)
 	unsigned char efr = readb(&ch->ch_neo_uart->efr);
 
 	/* Turn on auto RTS flow control */
-#if 1
 	ier |= UART_17158_IER_RTSDTR;
-#else
-	ier &= ~(UART_17158_IER_RTSDTR);
-#endif
+
 	efr |= (UART_17158_EFR_ECB | UART_17158_EFR_RTSDTR);
 
 	/* Turn off auto Xoff flow control */
-- 
1.7.1

