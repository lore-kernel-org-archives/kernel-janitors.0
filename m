From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:17:22 +0000
Subject: [PATCH 7/9] KVM: Return an error code only as a constant in kvm_get_dirty_log()
Message-Id: <f3477328-b978-e777-d3fc-913b22aaa05a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
In-Reply-To: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 17:41:07 +0100

* Return an error code without storing it in an intermediate variable.

* Delete the local variable "r" and the jump label "out" which became
  unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 virt/kvm/kvm_main.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a651a137ef21..ca88f3620ee3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1094,37 +1094,31 @@ int kvm_get_dirty_log(struct kvm *kvm,
 {
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *memslot;
-	int r, i, as_id, id;
+	int i, as_id, id;
 	unsigned long n;
 	unsigned long any = 0;
 
-	r = -EINVAL;
 	as_id = log->slot >> 16;
 	id = (u16)log->slot;
 	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
-		goto out;
+		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
 	memslot = id_to_memslot(slots, id);
-	r = -ENOENT;
 	if (!memslot->dirty_bitmap)
-		goto out;
+		return -ENOENT;
 
 	n = kvm_dirty_bitmap_bytes(memslot);
 
 	for (i = 0; !any && i < n/sizeof(long); ++i)
 		any = memslot->dirty_bitmap[i];
 
-	r = -EFAULT;
 	if (copy_to_user(log->dirty_bitmap, memslot->dirty_bitmap, n))
-		goto out;
+		return -EFAULT;
 
 	if (any)
 		*is_dirty = 1;
-
-	r = 0;
-out:
-	return r;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(kvm_get_dirty_log);
 
-- 
2.11.0

