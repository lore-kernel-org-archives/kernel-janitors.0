From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Fri, 01 Jul 2011 01:10:53 +0000
Subject: [PATCH v2] x86: smpboot: mark array as const
Message-Id: <1309482653-23648-1-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This array is read-only. Make it explicit by marking as const.

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 arch/x86/kernel/smpboot.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 9fd3137..9f548cb 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -438,7 +438,7 @@ static void impress_friends(void)
 void __inquire_remote_apic(int apicid)
 {
 	unsigned i, regs[] = { APIC_ID >> 4, APIC_LVR >> 4, APIC_SPIV >> 4 };
-	char *names[] = { "ID", "VERSION", "SPIV" };
+	const char * const names[] = { "ID", "VERSION", "SPIV" };
 	int timeout;
 	u32 status;
 
-- 
1.7.2.5

