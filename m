From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 14:23:51 +0000
Subject: [PATCH] KVM: SVM: Fix sev_pin_memory() error handling
Message-Id: <20200714142351.GA315374@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <sean.j.christopherson@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

The sev_pin_memory() function was modified to return error pointers
instead of NULL but there are two problems.  The first problem is that
if "npages" is zero then it still returns NULL.  Secondly, several of
the callers were not updated to check for error pointers instead of
NULL.

Either one of these issues will lead to an Oops.

Fixes: a8d908b5873c ("KVM: x86: report sev_pin_memory errors with PTR_ERR")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 arch/x86/kvm/svm/sev.c   |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index f7f1f4ecf08e..402dc4234e39 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -318,6 +318,7 @@ static struct page **sev_pin_memory(struct kvm *kvm, unsigned long uaddr,
 	unsigned long locked, lock_limit;
 	struct page **pages;
 	unsigned long first, last;
+	int ret;
 
 	if (ulen = 0 || uaddr + ulen < uaddr)
 		return ERR_PTR(-EINVAL);
@@ -351,6 +352,7 @@ static struct page **sev_pin_memory(struct kvm *kvm, unsigned long uaddr,
 	npinned = pin_user_pages_fast(uaddr, npages, write ? FOLL_WRITE : 0, pages);
 	if (npinned != npages) {
 		pr_err("SEV: Failure locking %lu pages.\n", npages);
+		ret = -ENOMEM;
 		goto err;
 	}
 
@@ -360,13 +362,11 @@ static struct page **sev_pin_memory(struct kvm *kvm, unsigned long uaddr,
 	return pages;
 
 err:
-	if (npinned > 0) {
+	if (npinned > 0)
 		unpin_user_pages(pages, npinned);
-		npinned = -ENOMEM;
-	}
 
 	kvfree(pages);
-	return ERR_PTR(npinned);
+	return ERR_PTR(ret);
 }
 
 static void sev_unpin_memory(struct kvm *kvm, struct page **pages,
@@ -440,8 +440,8 @@ static int sev_launch_update_data(struct kvm *kvm, struct kvm_sev_cmd *argp)
 
 	/* Lock the user memory. */
 	inpages = sev_pin_memory(kvm, vaddr, size, &npages, 1);
-	if (!inpages) {
-		ret = -ENOMEM;
+	if (IS_ERR(inpages)) {
+		ret = PTR_ERR(inpages);
 		goto e_free;
 	}
 
@@ -795,13 +795,13 @@ static int sev_dbg_crypt(struct kvm *kvm, struct kvm_sev_cmd *argp, bool dec)
 
 		/* lock userspace source and destination page */
 		src_p = sev_pin_memory(kvm, vaddr & PAGE_MASK, PAGE_SIZE, &n, 0);
-		if (!src_p)
-			return -EFAULT;
+		if (IS_ERR(src_p))
+			return PTR_ERR(src_p);
 
 		dst_p = sev_pin_memory(kvm, dst_vaddr & PAGE_MASK, PAGE_SIZE, &n, 1);
-		if (!dst_p) {
+		if (IS_ERR(dst_p)) {
 			sev_unpin_memory(kvm, src_p, n);
-			return -EFAULT;
+			return PTR_ERR(dst_p);
 		}
 
 		/*
