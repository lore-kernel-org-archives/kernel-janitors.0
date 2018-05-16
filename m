From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 May 2018 09:28:57 +0000
Subject: [PATCH] sample: vfio/mdev: add a missing error code
Message-Id: <20180516092857.GA25195@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We forgot to set "ret = -ENOMEM;" here.

Fixes: 2933b7a9b2fd ("sample: vfio mdev display - guest driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
 
