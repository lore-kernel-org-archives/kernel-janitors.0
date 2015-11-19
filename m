From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Nov 2015 12:41:25 +0000
Subject: [patch 2/2] KVM: fix vm_stat_get()
Message-Id: <20151119124125.GB2638@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gleb Natapov <gleb@kernel.org>, Janosch Frank <frankja@linux.vnet.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

The indenting suggests missing curly braces.

Fixes: 7805f53a85ec ('KVM: Create debugfs dir and stat files for each VM')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f62621f..4740e54 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3576,10 +3576,11 @@ static int vm_stat_get(void *_offset, u64 *val)
 
 	*val = 0;
 	spin_lock(&kvm_lock);
-	list_for_each_entry(kvm, &vm_list, vm_list)
+	list_for_each_entry(kvm, &vm_list, vm_list) {
 		stat_tmp.kvm = kvm;
 		vm_stat_get_per_vm((void *)&stat_tmp, &tmp_val);
 		*val += tmp_val;
+	}
 	spin_unlock(&kvm_lock);
 	return 0;
 }
