From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 14:51:35 +0000
Subject: [PATCH 02/12] dlm: drop unneeded newline
Message-Id: <1514386305-7402-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christine Caulfield <ccaulfie@redhat.com>
Cc: kernel-janitors@vger.kernel.org, David Teigland <teigland@redhat.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org

log_print prints a newline at the end of the message string, so
the message string does not need to include a newline explicitly.
Done using Coccinelle.

The two strings were additionally merged into one, for easier
grepping.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/dlm/plock.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index a4c63e9..ee84584 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -231,8 +231,7 @@ static int dlm_plock_callback(struct plock_op *op)
 	rv = notify(fl, 0);
 	if (rv) {
 		/* XXX: We need to cancel the fs lock here: */
-		log_print("dlm_plock_callback: lock granted after lock request "
-			  "failed; dangling lock!\n");
+		log_print("dlm_plock_callback: lock granted after lock request failed; dangling lock!");
 		goto out;
 	}
 

