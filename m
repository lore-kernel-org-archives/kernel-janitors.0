From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jun 2017 11:45:00 +0000
Subject: [PATCH] tools/power x86_energy_perf_policy: remove unneeded check
Message-Id: <20170628114500.bw2yhctvm6feo3hp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170517125156.10977-1-colin.king@canonical.com>
In-Reply-To: <20170517125156.10977-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <len.brown@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"i" is an int so this test is only ever possible with 32 bit systems.
The error message is not very useful and there are better tests directly
afterward so this test isn't needed.  Let's just delete these lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c b/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
index 65bbe627a425..de4a888f1a3e 100644
--- a/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
+++ b/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
@@ -332,8 +332,6 @@ int parse_optarg_string(char *s)
 		fprintf(stderr, "no digits in \"%s\"\n", s);
 		usage();
 	}
-	if (i = LONG_MIN || i = LONG_MAX)
-		errx(-1, "%s", s);
 
 	if (i > 0xFF)
 		errx(-1, "%d (0x%x) must be < 256", i, i);
