From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 16 Sep 2019 20:22:40 +0000
Subject: [PATCH] sample: vfio mdev display - Fix a missing error code in an error handling path
Message-Id: <20190916202240.30189-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kwankhede@nvidia.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'ret' is known to be 0 at this point. So explicitly set it to -ENOMEM if
'framebuffer_alloc()' fails.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 samples/vfio-mdev/mdpy-fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
index 2719bb259653..6fe0187f47a2 100644
--- a/samples/vfio-mdev/mdpy-fb.c
+++ b/samples/vfio-mdev/mdpy-fb.c
@@ -131,8 +131,10 @@ static int mdpy_fb_probe(struct pci_dev *pdev,
 		 width, height);
 
 	info = framebuffer_alloc(sizeof(struct mdpy_fb_par), &pdev->dev);
-	if (!info)
+	if (!info) {
+		ret = -ENOMEM;
 		goto err_release_regions;
+	}
 	pci_set_drvdata(pdev, info);
 	par = info->par;
 
-- 
2.20.1
