From: Colin King <colin.king@canonical.com>
Date: Fri, 18 May 2018 09:31:17 +0000
Subject: [PATCH] powerpc: fix spelling mistake: "Discharching" -> "Discharging"
Message-Id: <20180518093117.25668-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in battery_charging array

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/powerpc/kernel/rtas-proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
index d49063d0baa4..ed0ed0c9b7b3 100644
--- a/arch/powerpc/kernel/rtas-proc.c
+++ b/arch/powerpc/kernel/rtas-proc.c
@@ -504,7 +504,7 @@ static void ppc_rtas_process_sensor(struct seq_file *m,
 		"EPOW power off" };
 	const char * battery_cyclestate[]  = { "None", "In progress", 
 						"Requested" };
-	const char * battery_charging[]    = { "Charging", "Discharching", 
+	const char * battery_charging[]    = { "Charging", "Discharging",
 						"No current flow" };
 	const char * ibm_drconnector[]     = { "Empty", "Present", "Unusable", 
 						"Exchange" };
-- 
2.17.0

