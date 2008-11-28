From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 28 Nov 2008 16:02:42 +0000
Subject: [PATCH] KVM: fix sparse warning
Message-Id: <49304b32.0baa660a.462a.ffffb75d@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Kivity <avi@redhat.com>
Cc: kvm@vger.kernel.org

Impact: make global function static

  virt/kvm/kvm_main.c:85:6: warning: symbol 'kvm_rebooting' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 virt/kvm/kvm_main.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 54d25e6..8dab7ce 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -82,7 +82,7 @@ struct dentry *kvm_debugfs_dir;
 static long kvm_vcpu_ioctl(struct file *file, unsigned int ioctl,
 			   unsigned long arg);
 
-bool kvm_rebooting;
+static bool kvm_rebooting;
 
 #ifdef KVM_CAP_DEVICE_ASSIGNMENT
 
-- 
1.5.6.3

