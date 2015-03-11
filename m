From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 11 Mar 2015 16:56:27 +0000
Subject: [PATCH 5/15] clockevents: don't export static symbol
Message-Id: <1426092997-30605-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@iogearbox.net

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
identifier f;
@@

static T f (...) { ... }

@@
identifier r.f;
declarer name EXPORT_SYMBOL_GPL;
@@

-EXPORT_SYMBOL_GPL(f);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 kernel/time/clockevents.c |    1 -
 1 file changed, 1 deletion(-)

diff -u -p a/kernel/time/clockevents.c b/kernel/time/clockevents.c
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -424,7 +424,6 @@ int clockevents_unbind_device(struct clo
 	mutex_unlock(&clockevents_mutex);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(clockevents_unbind);
 
 /* Sanity check of mode transition callbacks */
 static int clockevents_sanity_check(struct clock_event_device *dev)

