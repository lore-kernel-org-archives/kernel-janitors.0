From: Borislav Petkov <bp@alien8.de>
Date: Fri, 25 Aug 2017 10:04:56 +0000
Subject: [PATCH] x86/microcode/intel: Improve microcode patches saving flow
Message-Id: <20170825100456.n236w3jebteokfd6@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170822211335.r7wcfcisdlq2xwgz@pd.tnic>
 <20170824201557.ev4ebslf6sg6xmne@mwanda>
 <20170824204714.jedeaphwmou5qafd@pd.tnic>
 <20170824205510.zy574qloxb4tsokq@mwanda>
 <20170824205844.3wkrq6vb7kv45vnv@pd.tnic>
 <20170824210847.hypvvpzf5pjhppyt@mwanda>
 <20170824211205.jpvmzzrm72vcb4xf@pd.tnic>
 <20170825090626.okc6reqltb5k4hip@pd.tnic>
 <20170825091228.acxl2pizbqe7ijnf@mwanda>
 <20170825091406.zytkd2pb5v6zxzrz@pd.tnic>
In-Reply-To: <20170825091406.zytkd2pb5v6zxzrz@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86-ml <x86@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Avoid potentially dereferencing a NULL pointer when saving a microcode
patch for early loading on the application processors.

While at it, drop the IS_ERR() checking in favor of simpler, NULL-ptr
checks which are sufficient and rename __alloc_microcode_buf() to
memdup_patch() to more precisely denote what it does.

No functionality change.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 arch/x86/kernel/cpu/microcode/intel.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 59edbe9d4ccb..8f7a9bbad514 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -146,18 +146,18 @@ static bool microcode_matches(struct microcode_header_intel *mc_header,
 	return false;
 }
 
-static struct ucode_patch *__alloc_microcode_buf(void *data, unsigned int size)
+static struct ucode_patch *memdup_patch(void *data, unsigned int size)
 {
 	struct ucode_patch *p;
 
 	p = kzalloc(sizeof(struct ucode_patch), GFP_KERNEL);
 	if (!p)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	p->data = kmemdup(data, size, GFP_KERNEL);
 	if (!p->data) {
 		kfree(p);
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 	}
 
 	return p;
@@ -183,8 +183,8 @@ static void save_microcode_patch(void *data, unsigned int size)
 			if (mc_hdr->rev <= mc_saved_hdr->rev)
 				continue;
 
-			p = __alloc_microcode_buf(data, size);
-			if (IS_ERR(p))
+			p = memdup_patch(data, size);
+			if (!p)
 				pr_err("Error allocating buffer %p\n", data);
 			else
 				list_replace(&iter->plist, &p->plist);
@@ -196,24 +196,25 @@ static void save_microcode_patch(void *data, unsigned int size)
 	 * newly found.
 	 */
 	if (!prev_found) {
-		p = __alloc_microcode_buf(data, size);
-		if (IS_ERR(p))
+		p = memdup_patch(data, size);
+		if (!p)
 			pr_err("Error allocating buffer for %p\n", data);
 		else
 			list_add_tail(&p->plist, &microcode_cache);
 	}
 
+	if (!p)
+		return;
+
 	/*
 	 * Save for early loading. On 32-bit, that needs to be a physical
 	 * address as the APs are running from physical addresses, before
 	 * paging has been enabled.
 	 */
-	if (p) {
-		if (IS_ENABLED(CONFIG_X86_32))
-			intel_ucode_patch = (struct microcode_intel *)__pa_nodebug(p->data);
-		else
-			intel_ucode_patch = p->data;
-	}
+	if (IS_ENABLED(CONFIG_X86_32))
+		intel_ucode_patch = (struct microcode_intel *)__pa_nodebug(p->data);
+	else
+		intel_ucode_patch = p->data;
 }
 
 static int microcode_sanity_check(void *mc, int print_err)
-- 
2.13.0


-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
