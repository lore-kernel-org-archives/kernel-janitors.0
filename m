From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 14:21:10 +0000
Subject: [PATCH -next] samples: vfio-mdev: fix error return code in mdpy_fb_probe()
Message-Id: <20200427142110.56121-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 samples/vfio-mdev/mdpy-fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
index 21dbf63d6e41..d4abc0594dbd 100644
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
