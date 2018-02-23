From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 23 Feb 2018 18:26:55 +0000
Subject: [PATCH 4.4 182/193] x86/spectre: Fix spelling mistake: "vunerable"-> "vulnerable"
Message-Id: <20180223170354.686167921@linuxfoundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180223170325.997716448@linuxfoundation.org>
In-Reply-To: <20180223170325.997716448@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Andi Kleen <ak@linux.intel.com>, kernel-janitors@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, David Woodhouse <dwmw@amazon.co.uk>, Jack Wang <jinpu.wang@profitbricks.com>

4.4-stable review patch.  If anyone has any objections, please let me know.

------------------

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
[jwang: cherry pick to 4.4]
Signed-off-by: Jack Wang <jinpu.wang@profitbricks.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/kernel/cpu/bugs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -103,7 +103,7 @@ bool retpoline_module_ok(bool has_retpol
 	if (spectre_v2_enabled = SPECTRE_V2_NONE || has_retpoline)
 		return true;
 
-	pr_err("System may be vunerable to spectre v2\n");
+	pr_err("System may be vulnerable to spectre v2\n");
 	spectre_v2_bad_module = true;
 	return false;
 }


