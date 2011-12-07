From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Dec 2011 06:38:49 +0000
Subject: [patch -next] x86: dubious one-bit signed bitfields
Message-Id: <20111207063848.GA14507@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

It doesn't cause any runtime problems in this case, but bitfields should
be unsigned.  This file gets included a lot so it generates thousands of
Sparse warnings about dubious one-bit signed bitfields.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
index 0ecd1a9..114dca1 100644
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@ -40,8 +40,8 @@ struct thread_info {
 						*/
 	__u8			supervisor_stack[0];
 #endif
-	int			sig_on_uaccess_error:1;
-	int			uaccess_err:1;	/* uaccess failed */
+	unsigned int		sig_on_uaccess_error:1;
+	unsigned int		uaccess_err:1;	/* uaccess failed */
 };
 
 #define INIT_THREAD_INFO(tsk)			\
