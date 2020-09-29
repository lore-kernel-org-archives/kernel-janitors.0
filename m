From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 Sep 2020 10:35:48 +0000
Subject: [PATCH] staging: rtl8712: Fix enqueue_reorder_recvframe()
Message-Id: <20200929103548.GA493135@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Sebastian Arriola <sebdeveloper6952@gmail.com>
Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>, devel@driverdev.osuosl.org, Cristiane Naves <cristianenavescardoso09@gmail.com>, Kees Cook <keescook@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ivan Safonov <insafonov@gmail.com>, kernel-janitors@vger.kernel.org, Pascal Terjan <pterjan@google.com>, Allen Pais <apais@linux.microsoft.com>, Wambui Karuga <wambui.karugax@gmail.com>

The logic of this function was accidentally broken by a checkpatch
inspired cleanup.  I've modified the code to restore the original
behavior and also make checkpatch happy.

Fixes: 98fe05e21a6e ("staging: rtl8712: Remove unnecesary else after return statement.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8712/rtl8712_recv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8712/rtl8712_recv.c
index 978594c676eb..db5c7a487ab3 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -476,11 +476,14 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl,
 	while (!end_of_queue_search(phead, plist)) {
 		pnextrframe = container_of(plist, union recv_frame, u.list);
 		pnextattrib = &pnextrframe->u.hdr.attrib;
+
+		if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
+			return false;
+
 		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
 			plist = plist->next;
-		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
-			return false;
-		break;
+		else
+			break;
 	}
 	list_del_init(&(prframe->u.hdr.list));
 	list_add_tail(&(prframe->u.hdr.list), plist);
-- 
2.28.0
