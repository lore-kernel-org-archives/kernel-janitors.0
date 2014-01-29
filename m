From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jan 2014 13:16:39 +0000
Subject: [patch] KVM: return an error code in kvm_vm_ioctl_register_coalesced_mmio()
Message-Id: <20140129131639.GB10678@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gleb Natapov <gleb@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

If kvm_io_bus_register_dev() fails then it returns success but it should
return an error code.

I also did a little cleanup like removing an impossible NULL test.

Fixes: 2b3c246a682c ('KVM: Make coalesced mmio use a device per zone')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/virt/kvm/coalesced_mmio.c b/virt/kvm/coalesced_mmio.c
index 88b2fe3ddf42..00d86427af0f 100644
--- a/virt/kvm/coalesced_mmio.c
+++ b/virt/kvm/coalesced_mmio.c
@@ -154,17 +154,13 @@ int kvm_vm_ioctl_register_coalesced_mmio(struct kvm *kvm,
 	list_add_tail(&dev->list, &kvm->coalesced_zones);
 	mutex_unlock(&kvm->slots_lock);
 
-	return ret;
+	return 0;
 
 out_free_dev:
 	mutex_unlock(&kvm->slots_lock);
-
 	kfree(dev);
 
-	if (dev = NULL)
-		return -ENXIO;
-
-	return 0;
+	return ret;
 }
 
 int kvm_vm_ioctl_unregister_coalesced_mmio(struct kvm *kvm,
