From: Jiri Olsa <jolsa@redhat.com>
Date: Thu, 06 May 2010 17:36:12 +0000
Subject: [PATCH 08/13] powerpc: removing redundant ifdefs
Message-Id: <1273167377-14270-9-git-send-email-jolsa@redhat.com>
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
 arch/powerpc/include/asm/vdso_datapage.h |    2 --
 arch/powerpc/kernel/traps.c              |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index 13c2c28..7c9cfe9 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -114,9 +114,7 @@ struct vdso_data {
 
 #endif /* CONFIG_PPC64 */
 
-#ifdef __KERNEL__
 extern struct vdso_data *vdso_data;
-#endif
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 29d128e..f472ecf 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1140,14 +1140,12 @@ void __kprobes DebugException(struct pt_regs *regs, unsigned long debug_status)
 
 		if (user_mode(regs)) {
 			current->thread.dbcr0 &= ~DBCR0_IC;
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
 			if (DBCR_ACTIVE_EVENTS(current->thread.dbcr0,
 					       current->thread.dbcr1))
 				regs->msr |= MSR_DE;
 			else
 				/* Make sure the IDM bit is off */
 				current->thread.dbcr0 &= ~DBCR0_IDM;
-#endif
 		}
 
 		_exception(SIGTRAP, regs, TRAP_TRACE, regs->nip);
-- 
1.6.6.1

