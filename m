From: Colin King <colin.king@canonical.com>
Date: Thu, 03 May 2018 09:09:10 +0000
Subject: [PATCH] cpupower: fix spelling mistake: "logilename" -> "logfilename"
Message-Id: <20180503090910.29144-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.com>, Shuah Khan <shuah@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dprintf message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/power/cpupower/bench/parse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/cpupower/bench/parse.c b/tools/power/cpupower/bench/parse.c
index 9b65f052081f..9ba8a44ad2a7 100644
--- a/tools/power/cpupower/bench/parse.c
+++ b/tools/power/cpupower/bench/parse.c
@@ -104,7 +104,7 @@ FILE *prepare_output(const char *dirname)
 			dirname, time(NULL));
 	}
 
-	dprintf("logilename: %s\n", filename);
+	dprintf("logfilename: %s\n", filename);
 
 	output = fopen(filename, "w+");
 	if (output = NULL) {
-- 
2.17.0

