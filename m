From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Jul 2017 19:52:55 +0000
Subject: [PATCH] tools/power x86_energy_perf_policy: fix shift wrapping bug
Message-Id: <20170725195255.ahyphfpjklnjrov3@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170517125156.10977-1-colin.king@canonical.com>
In-Reply-To: <20170517125156.10977-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <len.brown@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"pkg" goes up to 63 so there is a potential shift wrapping bug here.

Fixes: 4beec1d75196 ("tools/power x86_energy_perf_policy: support HWP.EPP")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c b/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
index 65bbe627a425..ad792cfbdc90 100644
--- a/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
+++ b/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
@@ -483,7 +483,7 @@ void parse_cmdline_pkg(char *s)
 			while (pkg <= end_pkg) {
 				if (pkg > max_pkg_num)
 					errx(1, "Requested pkg%d exceeds max pkg%d", pkg, max_pkg_num);
-				pkg_selected_set |= 1 << pkg;
+				pkg_selected_set |= 1ULL << pkg;
 				pkg++;
 			}
 			startp = endp;
@@ -498,7 +498,7 @@ void parse_cmdline_pkg(char *s)
 		pkg = strtol(startp, &endp, 10);
 		if (pkg > max_pkg_num)
 			errx(1, "Requested pkg%d Exceeds max pkg%d", pkg, max_pkg_num);
-		pkg_selected_set |= 1 << pkg;
+		pkg_selected_set |= 1ULL << pkg;
 		startp = endp;
 	}
 }
