From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 Nov 2019 11:59:54 +0000
Subject: [PATCH -next] staging: Fix error return code in vboxsf_fill_super()
Message-Id: <20191106115954.114678-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fsdevel@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: df4028658f9d ("staging: Add VirtualBox guest shared folder (vboxsf) support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/vboxsf/super.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vboxsf/super.c b/drivers/staging/vboxsf/super.c
index 3913ffafa83b..0bf4d724aefd 100644
--- a/drivers/staging/vboxsf/super.c
+++ b/drivers/staging/vboxsf/super.c
@@ -176,8 +176,10 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
 	/* Turn source into a shfl_string and map the folder */
 	size = strlen(fc->source) + 1;
 	folder_name = kmalloc(SHFLSTRING_HEADER_SIZE + size, GFP_KERNEL);
-	if (!folder_name)
+	if (!folder_name) {
+		err = -ENOMEM;
 		goto fail_free;
+	}
 	folder_name->size = size;
 	folder_name->length = size - 1;
 	strlcpy(folder_name->string.utf8, fc->source, size);
