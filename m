From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2019 15:12:17 +0000
Subject: [PATCH] xen: Prevent buffer overflow in privcmd ioctl
Message-Id: <20190404151217.GA22334@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>

The "call" variable comes from the user in privcmd_ioctl_hypercall().
It's an offset into the hypercall_page[] which has (PAGE_SIZE / 32)
elements.  We need to put an upper bound on it to prevent an out of
bounds access.

Fixes: 1246ae0bb992 ("xen: add variable hypercall caller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 arch/x86/include/asm/xen/hypercall.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
index de6f0d59a24f..2863c2026655 100644
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -206,6 +206,9 @@ xen_single_call(unsigned int call,
 	__HYPERCALL_DECLS;
 	__HYPERCALL_5ARG(a1, a2, a3, a4, a5);
 
+	if (call >= PAGE_SIZE / sizeof(hypercall_page[0]))
+		return -EINVAL;
+
 	asm volatile(CALL_NOSPEC
 		     : __HYPERCALL_5PARAM
 		     : [thunk_target] "a" (&hypercall_page[call])
-- 
2.17.1
