From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 18 Aug 2019 14:44:35 +0000
Subject: [PATCH] scsi: qla4xxx: Avoid usage of duplicated Header Guard
Message-Id: <20190818144435.2883-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@qlogic.com, jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

__QLA_NX_H is already used in 'drivers/scsi/qla2xxx/qla_nx.h', so use a
better name for the include headrr guard of 'ql4_nx.h'.
Use __QL4_NX_H

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/qla4xxx/ql4_nx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/qla4xxx/ql4_nx.h b/drivers/scsi/qla4xxx/ql4_nx.h
index 98fe78613eb7..2b94b39ee95f 100644
--- a/drivers/scsi/qla4xxx/ql4_nx.h
+++ b/drivers/scsi/qla4xxx/ql4_nx.h
@@ -4,8 +4,8 @@
  *
  * See LICENSE.qla4xxx for copyright and licensing details.
  */
-#ifndef __QLA_NX_H
-#define __QLA_NX_H
+#ifndef __QL4_NX_H
+#define __QL4_NX_H
 
 /*
  * Following are the states of the Phantom. Phantom will set them and
-- 
2.20.1
