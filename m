From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 12 Mar 2018 03:03:34 +0000
Subject: [PATCH 3.2 090/104] x86/spectre: Fix spelling mistake: "vunerable"-> "vulnerable"
Message-Id: <lsq.1520823814.368865130@decadent.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <lsq.1520823814.606620518@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, David Woodhouse <dwmw@amazon.co.uk>, kernel-janitors@vger.kernel.org, Borislav Petkov <bp@suse.de>, Andy Lutomirski <luto@kernel.org>, Colin Ian King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

3.2.101-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Colin Ian King <colin.king@canonical.com>

commit e698dcdfcda41efd0984de539767b4cddd235f1e upstream.

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
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/x86/kernel/cpu/bugs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -245,7 +245,7 @@ bool retpoline_module_ok(bool has_retpol
 	if (spectre_v2_enabled = SPECTRE_V2_NONE || has_retpoline)
 		return true;
 
-	pr_err("System may be vunerable to spectre v2\n");
+	pr_err("System may be vulnerable to spectre v2\n");
 	spectre_v2_bad_module = true;
 	return false;
 }

