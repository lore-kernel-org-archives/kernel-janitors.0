From: "Luck, Tony" <tony.luck@intel.com>
Date: Tue, 24 Jul 2012 21:07:11 +0000
Subject: RE: [next:akpm 121/309] include/linux/page-flags.h:462:2: error: implicit declaration of function 'V
Message-Id: <3908561D78D1C84285E8C5FCA982C28F19370D3D@ORSMSX104.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120722163512.GC13376@localhost>
In-Reply-To: <20120722163512.GC13376@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Looks like include/linux/page-flags.h (which uses VM_BUG_ON) needs to have a

#include <linux/mmdebug.h>

to make sure it sees the define.

-Tony

---

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index e66eb0d..b5d1384 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 #include <linux/bug.h>
+#include <linux/mmdebug.h>
 #ifndef __GENERATING_BOUNDS_H
 #include <linux/mm_types.h>
 #include <generated/bounds.h>


