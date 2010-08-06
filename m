From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:53:16 +0000
Subject: [PATCH 16/18] staging: sep: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124399-13929-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Ben Hutchings <ben@decadent.org.uk>, Joe Perches <joe@perches.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/sep/sep_driver.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/sep/sep_driver.c b/drivers/staging/sep/sep_driver.c
index ecbde34..d456729 100644
--- a/drivers/staging/sep/sep_driver.c
+++ b/drivers/staging/sep/sep_driver.c
@@ -2614,6 +2614,7 @@ end_function_deallocate_sep_shared_area:
 	sep_unmap_and_free_shared_area(sep, size);
 end_function_error:
 	sep_dev = NULL;
+	pci_disable_device(pdev);
 end_function:
 	return error;
 }
-- 
1.7.0.4

