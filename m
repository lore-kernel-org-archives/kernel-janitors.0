From: Julia Lawall <julia@diku.dk>
Date: Tue, 28 Jul 2009 15:53:24 +0000
Subject: [PATCH 3/9] virt/kvm: correct error-handling code
Message-Id: <Pine.LNX.4.64.0907281752560.28189@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: avi@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

This code is not executed before file has been initialized to the result of
calling eventfd_fget.  This function returns an ERR_PTR value in an error
case instead of NULL.  Thus the test that file is not NULL is always true.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@match exists@
expression x, E;
statement S1, S2;
@@

x = eventfd_fget(...)
... when != x = E
(
*  if (x = NULL || ...) S1 else S2
|
*  if (x = NULL && ...) S1 else S2
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 virt/kvm/eventfd.c                  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 99017e8..bb4ebd8 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -230,7 +230,7 @@ fail:
 	if (eventfd && !IS_ERR(eventfd))
 		eventfd_ctx_put(eventfd);
 
-	if (file && !IS_ERR(file))
+	if (!IS_ERR(file))
 		fput(file);
 
 	kfree(irqfd);
