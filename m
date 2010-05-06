From: Jiri Olsa <jolsa@redhat.com>
Date: Thu, 06 May 2010 17:36:06 +0000
Subject: [PATCH 02/13] ia64: removing redundant ifdef
Message-Id: <1273167377-14270-3-git-send-email-jolsa@redhat.com>
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
 arch/ia64/include/asm/mmzone.h |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/ia64/include/asm/mmzone.h b/arch/ia64/include/asm/mmzone.h
index f2ca320..e0de617 100644
--- a/arch/ia64/include/asm/mmzone.h
+++ b/arch/ia64/include/asm/mmzone.h
@@ -19,16 +19,12 @@
 
 static inline int pfn_to_nid(unsigned long pfn)
 {
-#ifdef CONFIG_NUMA
 	extern int paddr_to_nid(unsigned long);
 	int nid = paddr_to_nid(pfn << PAGE_SHIFT);
 	if (nid < 0)
 		return 0;
 	else
 		return nid;
-#else
-	return 0;
-#endif
 }
 
 #ifdef CONFIG_IA64_DIG /* DIG systems are small */
-- 
1.6.6.1

