From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 17:03:08 +0000
Subject: [PATCH 1/15] fs/dlm/rcom.c: removes unnecessary semicolon
Message-Id: <1347469402-27557-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christine Caulfield <ccaulfie@redhat.com>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, David Teigland <teigland@redhat.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 fs/dlm/rcom.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 9d61947..73d3715 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -577,7 +577,7 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 		lock = 1;
 		reply = 1;
 		break;
-	};
+	}
 
 	spin_lock(&ls->ls_recover_lock);
 	status = ls->ls_recover_status;

