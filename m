From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Aug 2017 20:15:57 +0000
Subject: [PATCH v2] x86/microcode: Silence a static checker warning
Message-Id: <20170824201557.ev4ebslf6sg6xmne@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170822211335.r7wcfcisdlq2xwgz@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The code here prints an error if "p" is an error pointer but it still
dereferences it at the end of the function when it does:

	intel_ucode_patch = (struct microcode_intel *)__pa_nodebug(p->data);

We can just return early instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: return early instead checking for IS_ERR_OR_NULL() at the end.

We have to keep the final check whether "p" is NULL to handle the
situation were we set "prev_found = true;" but then hit the continue
statement instead of allocating "p".

diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 59edbe9d4ccb..aab900ddea6a 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -184,10 +184,11 @@ static void save_microcode_patch(void *data, unsigned int size)
 				continue;
 
 			p = __alloc_microcode_buf(data, size);
-			if (IS_ERR(p))
+			if (IS_ERR(p)) {
 				pr_err("Error allocating buffer %p\n", data);
-			else
-				list_replace(&iter->plist, &p->plist);
+				return;
+			}
+			list_replace(&iter->plist, &p->plist);
 		}
 	}
 
@@ -197,10 +198,11 @@ static void save_microcode_patch(void *data, unsigned int size)
 	 */
 	if (!prev_found) {
 		p = __alloc_microcode_buf(data, size);
-		if (IS_ERR(p))
+		if (IS_ERR(p)) {
 			pr_err("Error allocating buffer for %p\n", data);
-		else
-			list_add_tail(&p->plist, &microcode_cache);
+			return;
+		}
+		list_add_tail(&p->plist, &microcode_cache);
 	}
 
 	/*
