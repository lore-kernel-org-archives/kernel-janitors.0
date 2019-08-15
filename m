From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Aug 2019 08:27:17 +0000
Subject: [PATCH] tools/power x86_energy_perf_policy: remove unneeded check
Message-Id: <20190815082717.GB27238@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170517125156.10977-1-colin.king@canonical.com>
In-Reply-To: <20170517125156.10977-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Winslow <swinslow@gmail.com>, Len Brown <len.brown@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "i" variable is an int.  The condition doesn't really make sense.
Since we ensure that "i" is in the 0 to 0xff range on the following
lines it's not required and this patch deletes it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c b/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
index 34a796b303fe..ce9a3fcf4a6c 100644
--- a/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
+++ b/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
@@ -331,8 +331,6 @@ int parse_optarg_string(char *s)
 		fprintf(stderr, "no digits in \"%s\"\n", s);
 		usage();
 	}
-	if (i = LONG_MIN || i = LONG_MAX)
-		errx(-1, "%s", s);
 
 	if (i > 0xFF)
 		errx(-1, "%d (0x%x) must be < 256", i, i);
-- 
2.20.1
