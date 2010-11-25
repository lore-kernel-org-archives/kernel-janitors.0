From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Thu, 25 Nov 2010 00:28:57 +0000
Subject: [PATCH] virt: kvm: coding style cleanups
Message-Id: <1290644937.6078.9.camel@javier-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes coding style issues on virt/kvm/assigned-dev.c

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 virt/kvm/assigned-dev.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/assigned-dev.c b/virt/kvm/assigned-dev.c
index ae72ae6..c9dd690 100644
--- a/virt/kvm/assigned-dev.c
+++ b/virt/kvm/assigned-dev.c
@@ -620,7 +620,7 @@ static int kvm_vm_ioctl_set_msix_nr(struct kvm *kvm,
 			goto msix_nr_out;
 		}
 		adev->guest_msix_entries -			kzalloc(sizeof(struct msix_entry) * entry_nr->entry_nr,
+			kzalloc(sizeof(struct msix_entry) *entry_nr->entry_nr,
 				GFP_KERNEL);
 		if (!adev->guest_msix_entries) {
 			kfree(adev->host_msix_entries);
@@ -750,7 +750,7 @@ long kvm_vm_ioctl_assigned_device(struct kvm *kvm, unsigned ioctl,
 			goto out_free_irq_routing;
 		r = kvm_set_irq_routing(kvm, entries, routing.nr,
 					routing.flags);
-	out_free_irq_routing:
+out_free_irq_routing:
 		vfree(entries);
 		break;
 	}
-- 
1.7.0.4





