From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 05 Aug 2012 09:52:33 +0000
Subject: [PATCH 3/6] arch/powerpc/kvm/e500_tlb.c: fix error return code
Message-Id: <1344160356-387-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Graf <agraf@suse.de>
Cc: kernel-janitors@vger.kernel.org, Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

From: Julia Lawall <julia@diku.dk>

Convert a 0 error return code to a negative one, as returned elsewhere in the
function.

A new label is also added to avoid freeing things that are known to not yet
be allocated.

A simplified version of the semantic match that finds the first problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret;
expression e,e1,e2,e3,e4,x;
@@

(
if (\(ret != 0\|ret < 0\) || ...) { ... return ...; }
|
ret = 0
)
... when != ret = e1
*x = \(kmalloc\|kzalloc\|kcalloc\|devm_kzalloc\|ioremap\|ioremap_nocache\|devm_ioremap\|devm_ioremap_nocache\)(...);
... when != x = e2
    when != ret = e3
*if (x = NULL || ...)
{
  ... when != ret = e4
*  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/powerpc/kvm/e500_tlb.c |   19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/e500_tlb.c b/arch/powerpc/kvm/e500_tlb.c
index c8f6c58..85fcdf7 100644
--- a/arch/powerpc/kvm/e500_tlb.c
+++ b/arch/powerpc/kvm/e500_tlb.c
@@ -1176,21 +1176,27 @@ int kvm_vcpu_ioctl_config_tlb(struct kvm_vcpu *vcpu,
 	}
 
 	virt = vmap(pages, num_pages, VM_MAP, PAGE_KERNEL);
-	if (!virt)
+	if (!virt) {
+		ret = -ENOMEM;
 		goto err_put_page;
+	}
 
 	privs[0] = kzalloc(sizeof(struct tlbe_priv) * params.tlb_sizes[0],
 			   GFP_KERNEL);
 	privs[1] = kzalloc(sizeof(struct tlbe_priv) * params.tlb_sizes[1],
 			   GFP_KERNEL);
 
-	if (!privs[0] || !privs[1])
-		goto err_put_page;
+	if (!privs[0] || !privs[1]) {
+		ret = -ENOMEM;
+		goto err_privs;
+	}
 
 	g2h_bitmap = kzalloc(sizeof(u64) * params.tlb_sizes[1],
 	                     GFP_KERNEL);
-	if (!g2h_bitmap)
-		goto err_put_page;
+	if (!g2h_bitmap) {
+		ret = -ENOMEM;
+		goto err_privs;
+	}
 
 	free_gtlb(vcpu_e500);
 
@@ -1230,10 +1236,11 @@ int kvm_vcpu_ioctl_config_tlb(struct kvm_vcpu *vcpu,
 	kvmppc_recalc_tlb1map_range(vcpu_e500);
 	return 0;
 
-err_put_page:
+err_privs:
 	kfree(privs[0]);
 	kfree(privs[1]);
 
+err_put_page:
 	for (i = 0; i < num_pages; i++)
 		put_page(pages[i]);
 
