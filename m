From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 01 Jun 2017 16:35:52 +0000
Subject: [PATCH] ARM: topology: Delete an error message for a failed memory allocation in parse_cpu_capacity(
Message-Id: <c1e7ffcf-bcb5-77da-b1b6-0cba939207f3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@arm.com>, Russell King <linux@armlinux.org.uk>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 1 Jun 2017 18:28:43 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/kernel/topology.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index f8a3ab82e77f..db81ec24f8d3 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -164,7 +164,6 @@ static int __init parse_cpu_capacity(struct device_node *cpu_node, int cpu)
 					       sizeof(*raw_capacity),
 					       GFP_KERNEL);
 			if (!raw_capacity) {
-				pr_err("cpu_capacity: failed to allocate memory for raw capacities\n");
 				cap_parsing_failed = true;
 				return !ret;
 			}
-- 
2.13.0

