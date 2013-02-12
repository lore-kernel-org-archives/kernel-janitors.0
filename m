From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 12 Feb 2013 04:01:52 +0000
Subject: [PATCH 4/5] staging: tidspbridge: remove redundant NULL check before delete_msg_mgr().
Message-Id: <1360641713-24895-5-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Cyril Roelandt <tipecaml@gmail.com>, omar.ramirez@copitl.com, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org


delete_msg_mgr on a NULL pointer is a no-op, so the NULL check in
bridge_msg_delete can be removed.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/tidspbridge/core/msg_sm.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/tidspbridge/core/msg_sm.c b/drivers/staging/tidspbridge/core/msg_sm.c
index ce9557e..7b517eb 100644
--- a/drivers/staging/tidspbridge/core/msg_sm.c
+++ b/drivers/staging/tidspbridge/core/msg_sm.c
@@ -198,8 +198,7 @@ out_err:
  */
 void bridge_msg_delete(struct msg_mgr *hmsg_mgr)
 {
-	if (hmsg_mgr)
-		delete_msg_mgr(hmsg_mgr);
+	delete_msg_mgr(hmsg_mgr);
 }
 
 /*
-- 
1.7.10.4

