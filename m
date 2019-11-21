From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 21 Nov 2019 03:25:02 +0000
Subject: [PATCH] virt: Fix Kconfig indentation
Message-Id: <1574306702-7834-1-git-send-email-krzk@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kvm@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fix also 7-space and tab+1 space indentation issues.
---
 drivers/virt/Kconfig | 10 +++++-----
 virt/kvm/Kconfig     | 42 +++++++++++++++++++++---------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 363af2eaf2ba..cb5d2d89592f 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -18,17 +18,17 @@ config FSL_HV_MANAGER
 	depends on FSL_SOC
 	select EPAPR_PARAVIRT
 	help
-          The Freescale hypervisor management driver provides several services
+	  The Freescale hypervisor management driver provides several services
 	  to drivers and applications related to the Freescale hypervisor:
 
-          1) An ioctl interface for querying and managing partitions.
+	  1) An ioctl interface for querying and managing partitions.
 
-          2) A file interface to reading incoming doorbells.
+	  2) A file interface to reading incoming doorbells.
 
-          3) An interrupt handler for shutting down the partition upon
+	  3) An interrupt handler for shutting down the partition upon
 	     receiving the shutdown doorbell from a manager partition.
 
-          4) A kernel interface for receiving callbacks when a managed
+	  4) A kernel interface for receiving callbacks when a managed
 	     partition shuts down.
 
 source "drivers/virt/vboxguest/Kconfig"
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index aad9284c043a..5f4184ecf1cf 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -2,61 +2,61 @@
 # KVM common configuration items and defaults
 
 config HAVE_KVM
-       bool
+	bool
 
 config HAVE_KVM_IRQCHIP
-       bool
+	bool
 
 config HAVE_KVM_IRQFD
-       bool
+	bool
 
 config HAVE_KVM_IRQ_ROUTING
-       bool
+	bool
 
 config HAVE_KVM_EVENTFD
-       bool
-       select EVENTFD
+	bool
+	select EVENTFD
 
 config KVM_MMIO
-       bool
+	bool
 
 config KVM_ASYNC_PF
-       bool
+	bool
 
 # Toggle to switch between direct notification and batch job
 config KVM_ASYNC_PF_SYNC
-       bool
+	bool
 
 config HAVE_KVM_MSI
-       bool
+	bool
 
 config HAVE_KVM_CPU_RELAX_INTERCEPT
-       bool
+	bool
 
 config KVM_VFIO
-       bool
+	bool
 
 config HAVE_KVM_ARCH_TLB_FLUSH_ALL
-       bool
+	bool
 
 config HAVE_KVM_INVALID_WAKEUPS
-       bool
+	bool
 
 config KVM_GENERIC_DIRTYLOG_READ_PROTECT
-       bool
+	bool
 
 config KVM_COMPAT
-       def_bool y
-       depends on KVM && COMPAT && !(S390 || ARM64)
+	def_bool y
+	depends on KVM && COMPAT && !(S390 || ARM64)
 
 config HAVE_KVM_IRQ_BYPASS
-       bool
+	bool
 
 config HAVE_KVM_VCPU_ASYNC_IOCTL
-       bool
+	bool
 
 config HAVE_KVM_VCPU_RUN_PID_CHANGE
-       bool
+	bool
 
 config HAVE_KVM_NO_POLL
-       bool
+	bool
-- 
2.7.4
