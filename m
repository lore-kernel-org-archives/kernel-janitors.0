From: Dan Carpenter <error27@gmail.com>
Date: Thu, 03 Jun 2010 10:07:46 +0000
Subject: [patch] x86: xsave: cleanup return codes in check_for_xstate()
Message-Id: <20100603100746.GU5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Avi Kivity <avi@redhat.com>, Hongjiu Lu <hjl.tools@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The places which call check_for_xstate() only care about zero or
non-zero so this patch doesn't change how the code runs, but it's a 
cleanup.  The main reason for this patch is that I'm looking for places
which don't return -EFAULT for copy_from_user() failures.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/arch/x86/kernel/xsave.c b/arch/x86/kernel/xsave.c
index 37e68fc..9801498 100644
--- a/arch/x86/kernel/xsave.c
+++ b/arch/x86/kernel/xsave.c
@@ -36,15 +36,14 @@ int check_for_xstate(struct i387_fxsave_struct __user *buf,
 
 	err = __copy_from_user(fx_sw_user, &buf->sw_reserved[0],
 			       sizeof(struct _fpx_sw_bytes));
-
 	if (err)
-		return err;
+		return -EFAULT;
 
 	/*
 	 * First Magic check failed.
 	 */
 	if (fx_sw_user->magic1 != FP_XSTATE_MAGIC1)
-		return -1;
+		return -EINVAL;
 
 	/*
 	 * Check for error scenarios.
@@ -52,19 +51,21 @@ int check_for_xstate(struct i387_fxsave_struct __user *buf,
 	if (fx_sw_user->xstate_size < min_xstate_size ||
 	    fx_sw_user->xstate_size > xstate_size ||
 	    fx_sw_user->xstate_size > fx_sw_user->extended_size)
-		return -1;
+		return -EINVAL;
 
 	err = __get_user(magic2, (__u32 *) (((void *)fpstate) +
 					    fx_sw_user->extended_size -
 					    FP_XSTATE_MAGIC2_SIZE));
+	if (err)
+		return err;
 	/*
 	 * Check for the presence of second magic word at the end of memory
 	 * layout. This detects the case where the user just copied the legacy
 	 * fpstate layout with out copying the extended state information
 	 * in the memory layout.
 	 */
-	if (err || magic2 != FP_XSTATE_MAGIC2)
-		return -1;
+	if (magic2 != FP_XSTATE_MAGIC2)
+		return -EFAULT;
 
 	return 0;
 }
