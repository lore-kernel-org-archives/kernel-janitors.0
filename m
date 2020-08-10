From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 10:21:15 +0000
Subject: [PATCH] cpupowerutils: fix spelling mistake "dependant" -> "dependent"
Message-Id: <20200810102115.62405-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.com>, Shuah Khan <shuah@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/power/cpupower/debug/i386/intel_gsic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/cpupower/debug/i386/intel_gsic.c b/tools/power/cpupower/debug/i386/intel_gsic.c
index e5e926f46d6b..befd837f07f8 100644
--- a/tools/power/cpupower/debug/i386/intel_gsic.c
+++ b/tools/power/cpupower/debug/i386/intel_gsic.c
@@ -71,7 +71,7 @@ int main (void)
 		printf("\tsmi_cmd=0x?? smi_port=0x?? smi_sig=1\n");
 		printf("\nUnfortunately, you have to know what exactly are "
 		       "smi_cmd and smi_port, and this\nis system "
-		       "dependant.\n");
+		       "dependent.\n");
 	}
 	return 1;
 }
-- 
2.27.0
