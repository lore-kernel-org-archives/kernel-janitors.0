From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 27 Sep 2018 10:52:17 +0000
Subject: [PATCH -next] VMCI: remove set but not used variable 'cid'
Message-Id: <1538046079-137795-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, zhong jiang <zhongjiang@huawei.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/misc/vmw_vmci/vmci_host.c: In function 'vmci_host_do_alloc_queuepair':
drivers/misc/vmw_vmci/vmci_host.c:450:6: warning:
 variable 'cid' set but not used [-Wunused-but-set-variable]
  u32 cid;
      ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/misc/vmw_vmci/vmci_host.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index be732e5..edfffc9 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -447,15 +447,12 @@ static int vmci_host_do_alloc_queuepair(struct vmci_host_dev *vmci_host_dev,
 	struct vmci_handle handle;
 	int vmci_status;
 	int __user *retptr;
-	u32 cid;
 
 	if (vmci_host_dev->ct_type != VMCIOBJ_CONTEXT) {
 		vmci_ioctl_err("only valid for contexts\n");
 		return -EINVAL;
 	}
 
-	cid = vmci_ctx_get_id(vmci_host_dev->context);
-
 	if (vmci_host_dev->user_version < VMCI_VERSION_NOVMVM) {
 		struct vmci_qp_alloc_info_vmvm alloc_info;
 		struct vmci_qp_alloc_info_vmvm __user *info = uptr;
