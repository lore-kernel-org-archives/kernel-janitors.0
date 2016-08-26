From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Aug 2016 12:55:44 +0000
Subject: [PATCH 5/8] cris-cryptocop: Move an assignment for the variable "nooutpages" in cryptocop_ioctl_proc
Message-Id: <2a70980b-54e3-812c-b76e-6b64640c469c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <bfc23090-e05d-f491-2a28-1803ceb31a31@users.sourceforge.net>
In-Reply-To: <bfc23090-e05d-f491-2a28-1803ceb31a31@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cris-kernel@axis.com, Adam Buchbinder <adam.buchbinder@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Jiri Kosina <jkosina@suse.cz>, Mikael Starvik <starvik@axis.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Aug 2016 13:38:30 +0200

Move the assignment for the local variable "nooutpages" behind
the source code for memory allocations by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/cris/arch-v32/drivers/cryptocop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/cris/arch-v32/drivers/cryptocop.c b/arch/cris/arch-v32/drivers/cryptocop.c
index 26347a2..cd34723 100644
--- a/arch/cris/arch-v32/drivers/cryptocop.c
+++ b/arch/cris/arch-v32/drivers/cryptocop.c
@@ -2469,7 +2469,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 	struct page                     **inpages = NULL;
 	struct page                     **outpages = NULL;
 	int                             noinpages = 0;
-	int                             nooutpages = 0;
+	int                             nooutpages;
 
 	struct cryptocop_desc           descs[5]; /* Max 5 descriptors are needed, there are three transforms that
 						   * can get connected/disconnected on different places in the indata. */
@@ -2695,6 +2695,8 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 			err = -ENOMEM;
 			goto free_inpages;
 		}
+	} else {
+		nooutpages = 0;
 	}
 
 	/* Acquire the mm page semaphore. */
-- 
2.9.3

