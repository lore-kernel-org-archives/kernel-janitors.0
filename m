From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Nov 2014 12:53:00 +0000
Subject: [patch] kvm: x86: potential shift wrapping bug
Message-Id: <20141124125300.GA11942@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gleb Natapov <gleb@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

cs.base is declared as a __u64 variable and vector is a u32 so this
causes a static checker warning.  I'm not very familiar with this code
but my understanding is that the user can set "sipi_vector" to any u32
value in kvm_vcpu_ioctl_x86_set_vcpu_events().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 34c8f94..6608115 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7000,7 +7000,7 @@ void kvm_vcpu_deliver_sipi_vector(struct kvm_vcpu *vcpu, unsigned int vector)
 
 	kvm_get_segment(vcpu, &cs, VCPU_SREG_CS);
 	cs.selector = vector << 8;
-	cs.base = vector << 12;
+	cs.base = (u64)vector << 12;
 	kvm_set_segment(vcpu, &cs, VCPU_SREG_CS);
 	kvm_rip_write(vcpu, 0);
 }
