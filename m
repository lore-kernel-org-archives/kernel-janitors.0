From: Jack Wang <jinpu.wang@profitbricks.com>
Date: Fri, 23 Feb 2018 10:42:08 +0000
Subject: [stable 4.4 19/29] x86/spectre: Fix spelling mistake: "vunerable"-> "vulnerable"
Message-Id: <1519382538-15143-20-git-send-email-jinpu.wangl@profitbricks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1519382538-15143-1-git-send-email-jinpu.wangl@profitbricks.com>
In-Reply-To: <1519382538-15143-1-git-send-email-jinpu.wangl@profitbricks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, stable@vger.kernel.org
Cc: Colin Ian King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Andi Kleen <ak@linux.intel.com>, kernel-janitors@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, David Woodhouse <dwmw@amazon.co.uk>, Jack Wang <jinpu.wang@profitbricks.com>

From: Colin Ian King <colin.king@canonical.com>

(cherry picked from commit e698dcdfcda41efd0984de539767b4cddd235f1e)

Trivial fix to spelling mistake in pr_err error message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@suse.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Link: https://lkml.kernel.org/r/20180130193218.9271-1-colin.king@canonical.com
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[jwang: cherry pick to 4.4]
Signed-off-by: Jack Wang <jinpu.wang@profitbricks.com>
---
 arch/x86/kernel/cpu/bugs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 812813e..6272c20 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -103,7 +103,7 @@ bool retpoline_module_ok(bool has_retpoline)
 	if (spectre_v2_enabled = SPECTRE_V2_NONE || has_retpoline)
 		return true;
 
-	pr_err("System may be vunerable to spectre v2\n");
+	pr_err("System may be vulnerable to spectre v2\n");
 	spectre_v2_bad_module = true;
 	return false;
 }
-- 
2.7.4

