From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 30 Oct 2018 20:27:13 +0000
Subject: [PATCH v2] codafs: Fix build using bare-metal toolchain
Message-Id: <20181030202713.26203-1-semen.protsenko@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, codalist@coda.cs.cmu.edu, coda@cs.cmu.edu, Andy Shevchenko <andy.shevchenko@gmail.com>, Praneeth Bajjuri <praneeth@ti.com>

The kernel is self-contained project and can be built with bare-metal
toolchain. But bare-metal toolchain doesn't define __linux__. Because of
this u_quad_t type is not defined when using bare-metal toolchain and
codafs build fails. This patch fixes it by defining u_quad_t type
unconditionally.

Cc: Jan Harkes <jaharkes@cs.cmu.edu>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 include/linux/coda.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/coda.h b/include/linux/coda.h
index d30209b9cef8..0ca0c83fdb1c 100644
--- a/include/linux/coda.h
+++ b/include/linux/coda.h
@@ -58,8 +58,7 @@ Mellon the rights to redistribute these changes without encumbrance.
 #ifndef _CODA_HEADER_
 #define _CODA_HEADER_
 
-#if defined(__linux__)
 typedef unsigned long long u_quad_t;
-#endif
+
 #include <uapi/linux/coda.h>
 #endif 
-- 
2.19.1
