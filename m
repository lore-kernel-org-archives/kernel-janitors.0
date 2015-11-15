From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Nov 2015 11:42:52 +0000
Subject: [PATCH] kernel-audit: Delete unnecessary checks before two function calls
Message-Id: <56486FBC.3070103@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Paris <eparis@redhat.com>, Paul Moore <paul@paul-moore.com>, linux-audit@redhat.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Nov 2015 12:38:33 +0100

The functions consume_skb() and kfree_skb() test whether their argument
is NULL and then return immediately.
Thus the tests around their calls are not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/audit.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 5ffcbd3..1e8e228 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -509,8 +509,7 @@ static void flush_hold_queue(void)
 	 * if auditd just disappeared but we
 	 * dequeued an skb we need to drop ref
 	 */
-	if (skb)
-		consume_skb(skb);
+	consume_skb(skb);
 }
 
 static int kauditd_thread(void *dummy)
@@ -1232,9 +1231,7 @@ static void audit_buffer_free(struct audit_buffer *ab)
 	if (!ab)
 		return;
 
-	if (ab->skb)
-		kfree_skb(ab->skb);
-
+	kfree_skb(ab->skb);
 	spin_lock_irqsave(&audit_freelist_lock, flags);
 	if (audit_freelist_count > AUDIT_MAXFREE)
 		kfree(ab);
-- 
2.6.2

