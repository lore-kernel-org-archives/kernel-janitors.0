From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Thu, 30 Jun 2011 22:31:48 +0000
Subject: [PATCH] x86: smpboot: mark array as const
Message-Id: <1309473108-5337-1-git-send-email-Gregory.Dietsche@cuw.edu>
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
index 9fd3137..4218569 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -438,7 +438,7 @@ static void impress_friends(void)
 void __inquire_remote_apic(int apicid)
 {
 	unsigned i, regs[] = { APIC_ID >> 4, APIC_LVR >> 4, APIC_SPIV >> 4 };
-	char *names[] = { "ID", "VERSION", "SPIV" };
+	const char const *names[] = { "ID", "VERSION", "SPIV" };
 	int timeout;
 	u32 status;
 
-- 
1.7.2.5

