From: Lucas Woods <woodzy@gmail.com>
Date: Mon, 05 Nov 2007 20:15:38 +0000
Subject: [PATCH 10/12] arch/um: Remove duplicate includes.
Message-Id: <472F79EA.2030509@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Lucas Woods <woodzy@gmail.com>
---
 arch/um/os-Linux/sigio.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/um/os-Linux/sigio.c b/arch/um/os-Linux/sigio.c
index dc03e9c..b068d63 100644
--- a/arch/um/os-Linux/sigio.c
+++ b/arch/um/os-Linux/sigio.c
@@ -20,7 +20,6 @@
 #include "sigio.h"
 #include "os.h"
 #include "um_malloc.h"
-#include "init.h"
 
 /* Protected by sigio_lock(), also used by sigio_cleanup, which is an
  * exitcall.
-- 


