From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2016 19:21:05 +0000
Subject: [patch] KVM: use after free in kvm_ioctl_create_device()
Message-Id: <20161130192105.GC28180@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, Christoffer Dall <christoffer.dall@linaro.org>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

We should move the ops->destroy(dev) after the list_del(&dev->vm_node)
so that we don't use "dev" after freeing it.

Fixes: a28ebea2adc4 ("KVM: Protect device ops->create and list_add with kvm->lock")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 69a1247..de102ca 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2899,10 +2899,10 @@ static int kvm_ioctl_create_device(struct kvm *kvm,
 
 	ret = anon_inode_getfd(ops->name, &kvm_device_fops, dev, O_RDWR | O_CLOEXEC);
 	if (ret < 0) {
-		ops->destroy(dev);
 		mutex_lock(&kvm->lock);
 		list_del(&dev->vm_node);
 		mutex_unlock(&kvm->lock);
+		ops->destroy(dev);
 		return ret;
 	}
 
