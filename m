From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2015 11:56:54 +0000
Subject: [PATCH] GPU-host1x: Use a signed return type for do_relocs()
Message-Id: <56754606.6060201@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2015 12:48:31 +0100

The return type "unsigned int" was used by the do_relocs() function
despite of the aspect that it will eventually return a negative error code.
Improve this implementation detail by deletion of the type qualifier then.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/host1x/job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 63bd63f..1919aab 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -225,7 +225,7 @@ unpin:
 	return 0;
 }
 
-static unsigned int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
+static int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
 {
 	int i = 0;
 	u32 last_page = ~0;
-- 
2.6.3

