From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 27 Apr 2015 20:35:34 +0000
Subject: [PATCH] KVM: x86: drop unneeded null test
Message-Id: <1430166934-30834-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gleb Natapov <gleb@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>, zhanghy@sangfor.com, jasowang@redhat.com
Cc: kernel-janitors@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

If the null test is needed, the call to cancel_delayed_work_sync would have
already crashed.  Normally, the destroy function should only be called
if the init functoin has succeeded, in which case ioapic is not null.

Problem found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/x86/kvm/ioapic.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/ioapic.c b2/arch/x86/kvm/ioapic.c
index 28146f0..09828e2 100644
--- a/arch/x86/kvm/ioapic.c
+++ b2/arch/x86/kvm/ioapic.c
@@ -637,11 +637,9 @@ void kvm_ioapic_destroy(struct kvm *kvm)
 	struct kvm_ioapic *ioapic = kvm->arch.vioapic;
 
 	cancel_delayed_work_sync(&ioapic->eoi_inject);
-	if (ioapic) {
-		kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &ioapic->dev);
-		kvm->arch.vioapic = NULL;
-		kfree(ioapic);
-	}
+	kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &ioapic->dev);
+	kvm->arch.vioapic = NULL;
+	kfree(ioapic);
 }
 
 int kvm_get_ioapic(struct kvm *kvm, struct kvm_ioapic_state *state)

