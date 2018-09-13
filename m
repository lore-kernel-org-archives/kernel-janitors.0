From: Josh Abraham <j.abraham1776@gmail.com>
Date: Thu, 13 Sep 2018 01:13:54 +0000
Subject: [PATCH] xen: fix GCC warning and remove duplicate EVTCHN_ROW/EVTCHN_COL usage
Message-Id: <20180913011354.GA19226@josh-ThinkPad-T460s>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: boris.ostrovsky@oracle.com
Cc: jgross@suse.com, aams@amazon.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, j.abraham1776@gmail.com

This patch removes duplicate macro useage in events_base.c.

It also fixes gcc warning:
variable ‘col’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Joshua Abraham <j.abraham1776@gmail.com>
---
 drivers/xen/events/events_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 08e4af04d6f2..e6c1934734b7 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -138,7 +138,7 @@ static int set_evtchn_to_irq(unsigned evtchn, unsigned irq)
 		clear_evtchn_to_irq_row(row);
 	}
 
-	evtchn_to_irq[EVTCHN_ROW(evtchn)][EVTCHN_COL(evtchn)] = irq;
+	evtchn_to_irq[row][col] = irq;
 	return 0;
 }
 
-- 
2.17.1
