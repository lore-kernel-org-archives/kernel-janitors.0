From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 17:49:49 +0000
Subject: [PATCH 09/10] x86/crash: use resource_size
Message-Id: <1577900990-8588-10-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ struct resource ptr; @@
- (ptr.end - ptr.start + 1)
+ resource_size(&ptr)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/x86/kernel/crash.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 00fc55ac7ffa..fd87b59452a3 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -370,7 +370,7 @@ int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
 	/* Add crashk_low_res region */
 	if (crashk_low_res.end) {
 		ei.addr = crashk_low_res.start;
-		ei.size = crashk_low_res.end - crashk_low_res.start + 1;
+		ei.size = resource_size(&crashk_low_res);
 		ei.type = E820_TYPE_RAM;
 		add_e820_entry(params, &ei);
 	}
