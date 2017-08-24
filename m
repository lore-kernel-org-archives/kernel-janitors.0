From: Borislav Petkov <bp@alien8.de>
Date: Thu, 24 Aug 2017 20:47:14 +0000
Subject: Re: [PATCH v2] x86/microcode: Silence a static checker warning
Message-Id: <20170824204714.jedeaphwmou5qafd@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170822211335.r7wcfcisdlq2xwgz@pd.tnic>
 <20170824201557.ev4ebslf6sg6xmne@mwanda>
In-Reply-To: <20170824201557.ev4ebslf6sg6xmne@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 24, 2017 at 11:15:57PM +0300, Dan Carpenter wrote:
> The code here prints an error if "p" is an error pointer but it still
> dereferences it at the end of the function when it does:
> 
> 	intel_ucode_patch = (struct microcode_intel *)__pa_nodebug(p->data);
> 
> We can just return early instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: return early instead checking for IS_ERR_OR_NULL() at the end.
> 
> We have to keep the final check whether "p" is NULL to handle the
> situation were we set "prev_found = true;" but then hit the continue
> statement instead of allocating "p".

I think we want to something more like this (not exit the loop if the
allocation fails). But I need to look at the again on a clear head:a

---
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 59edbe9d4ccb..0179f0fd8a79 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -146,7 +146,7 @@ static bool microcode_matches(struct microcode_header_intel *mc_header,
 	return false;
 }
 
-static struct ucode_patch *__alloc_microcode_buf(void *data, unsigned int size)
+static struct ucode_patch *memdup_patch(void *data, unsigned int size)
 {
 	struct ucode_patch *p;
 
@@ -183,11 +183,13 @@ static void save_microcode_patch(void *data, unsigned int size)
 			if (mc_hdr->rev <= mc_saved_hdr->rev)
 				continue;
 
-			p = __alloc_microcode_buf(data, size);
-			if (IS_ERR(p))
+			p = memdup_patch(data, size);
+			if (IS_ERR(p)) {
 				pr_err("Error allocating buffer %p\n", data);
-			else
-				list_replace(&iter->plist, &p->plist);
+				continue;
+			}
+
+			list_replace(&iter->plist, &p->plist);
 		}
 	}
 
@@ -196,11 +198,12 @@ static void save_microcode_patch(void *data, unsigned int size)
 	 * newly found.
 	 */
 	if (!prev_found) {
-		p = __alloc_microcode_buf(data, size);
-		if (IS_ERR(p))
+		p = memdup_patch(data, size);
+		if (IS_ERR(p)) {
 			pr_err("Error allocating buffer for %p\n", data);
-		else
-			list_add_tail(&p->plist, &microcode_cache);
+			return;
+		}
+		list_add_tail(&p->plist, &microcode_cache);
 	}
 
 	/*

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
