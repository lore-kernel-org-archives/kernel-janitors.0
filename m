From: Jiri Olsa <jolsa@redhat.com>
Date: Thu, 06 May 2010 17:36:11 +0000
Subject: [PATCH 07/13] h8300: removing redundant ifdef
Message-Id: <1273167377-14270-8-git-send-email-jolsa@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273167377-14270-1-git-send-email-jolsa@redhat.com>
In-Reply-To: <1273167377-14270-1-git-send-email-jolsa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ysato@users.sourceforge.jp, tony.luck@intel.com, dhowells@redhat.com, kyle@mcmartin.ca, benh@kernel.crashing.org, schwidefsky@de.ibm.com, jgarzik@pobox.com, hare@suse.de, felipe.balbi@nokia.com, Jiri Olsa <jolsa@redhat.com>

wbr,
jirka


Signed-off-by: Jiri Olsa <jolsa@redhat.com>
---
 arch/h8300/include/asm/tlb.h |   13 -------------
 1 files changed, 0 insertions(+), 13 deletions(-)

diff --git a/arch/h8300/include/asm/tlb.h b/arch/h8300/include/asm/tlb.h
index 3dea80a..6339a02 100644
--- a/arch/h8300/include/asm/tlb.h
+++ b/arch/h8300/include/asm/tlb.h
@@ -7,17 +7,4 @@
 
 #define tlb_flush(tlb)	do { } while(0)
 
-/* 
-  include/asm-h8300/tlb.h 
-*/
-
-#ifndef __H8300_TLB_H__
-#define __H8300_TLB_H__
-
-#define tlb_flush(tlb)	do { } while(0)
-
-#include <asm-generic/tlb.h>
-
-#endif
-
 #endif
-- 
1.6.6.1

