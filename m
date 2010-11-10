From: Vasiliy Kulikov <segooon@gmail.com>
Date: Wed, 10 Nov 2010 20:38:08 +0000
Subject: [PATCH] lib: vsprintf: fix invalid arg check
Message-Id: <1289421490-23950-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?q?Andr=C3=A9=20Goddard=20Rosa?= <andre.goddard@gmail.com>, Joe Perches <joe@perches.com>, Frederic Weisbecker <fweisbec@gmail.com>, Bjorn Helgaas <bjorn.helgaas@hp.com>, linux-kernel@vger.kernel.org

"size" is size_t.  If we want to check whether it was underflowed
then we should cast it to ssize_t instead of int.  When
sizeof(size_t) > sizeof(int) the code sees UINT_MAX as underflow,
but it is not.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 lib/vsprintf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index c150d3d..e7cf674 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1290,7 +1290,7 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
 
 	/* Reject out-of-range values early.  Large positive sizes are
 	   used for unknown buffer sizes. */
-	if (WARN_ON_ONCE((int) size < 0))
+	if (WARN_ON_ONCE((ssize_t) size < 0))
 		return 0;
 
 	str = buf;
-- 
1.7.0.4

