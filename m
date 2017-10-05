From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Oct 2017 16:08:13 +0000
Subject: [PATCH] powerpc/perf/hv-24x7: Delete an error message for a failed memory allocation in create_event
Message-Id: <427d4a01-e0ec-9a52-46cb-685c43962a96@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Oct 2017 18:02:05 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/perf/hv-24x7.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 9c88b82f6229..f21f30aaf9bd 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -766,7 +766,6 @@ static int create_events_from_catalog(struct attribute ***events_,
 	 */
 	event_data = vmalloc(event_data_bytes);
 	if (!event_data) {
-		pr_err("could not allocate event data\n");
 		ret = -ENOMEM;
 		goto e_free;
 	}
-- 
2.14.2

