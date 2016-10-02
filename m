From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 02 Oct 2016 07:04:16 +0000
Subject: [PATCH] ptp: Fix resource leak in case of error
Message-Id: <1475391856-15046-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richardcochran@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

A call to 'ida_simple_remove()' is missing in the error handling path.

This as been spotted with the following coccinelle script which tries to
detect missing 'ida_simple_remove()' call in error handling paths.

///////////////
@@
expression x;
identifier l;
@@

*   x = ida_simple_get(...);
    ...
    if (...) {
    ...
    }
    ...
    if (...) {
       ...
       goto l;
    }
    ...
*   l: ... when != ida_simple_remove(...);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile-tested only
---
 drivers/ptp/ptp_clock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index 2e481b9e8ea5..86280b7e41f3 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -263,6 +263,7 @@ struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
 no_device:
 	mutex_destroy(&ptp->tsevq_mux);
 	mutex_destroy(&ptp->pincfg_mux);
+	ida_simple_remove(&ptp_clocks_map, index);
 no_slot:
 	kfree(ptp);
 no_memory:
-- 
2.7.4

