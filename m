From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Aug 2016 12:58:08 +0000
Subject: [PATCH 7/8] cris-cryptocop: Delete unnecessary variable initialisations in cryptocop_ioctl_process()
Message-Id: <e071f0a1-536b-150d-3f2b-f0b806e59559@users.sourceforge.net>
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
Date: Fri, 26 Aug 2016 13:57:21 +0200

Nine local variables will be set to an appropriate value a bit later.
Thus omit the explicit initialisation which became unnecessary with
a previous update step.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/cris/arch-v32/drivers/cryptocop.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/cryptocop.c b/arch/cris/arch-v32/drivers/cryptocop.c
index a682b1f..1a966dc 100644
--- a/arch/cris/arch-v32/drivers/cryptocop.c
+++ b/arch/cris/arch-v32/drivers/cryptocop.c
@@ -2461,14 +2461,12 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 	struct cryptocop_private        *dev = filp->private_data;
 	struct strcop_crypto_op         *crp_oper = (struct strcop_crypto_op *)arg;
 	struct strcop_crypto_op         oper = {0};
-	int                             err = 0;
-	struct cryptocop_operation      *cop = NULL;
-
-	struct ioctl_job_cb_ctx         *jc = NULL;
-
-	struct page                     **inpages = NULL;
+	int                             err;
+	struct cryptocop_operation      *cop;
+	struct ioctl_job_cb_ctx         *jc;
+	struct page                     **inpages;
 	struct page                     **outpages = NULL;
-	int                             noinpages = 0;
+	int                             noinpages;
 	int                             nooutpages;
 
 	struct cryptocop_desc           descs[5]; /* Max 5 descriptors are needed, there are three transforms that
@@ -2482,16 +2480,14 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 
 	unsigned char                   *digest_result = NULL;
 	int                             digest_length = 0;
-	int                             cblocklen = 0;
+	int                             cblocklen;
 	unsigned char                   csum_result[CSUM_BLOCK_LENGTH];
 	struct cryptocop_session        *sess;
-
-	int    iovlen = 0;
+	int    iovlen;
 	int    iovix = 0;
 	int    pageix = 0;
-	int    pageoffset = 0;
-
-	size_t prev_ix = 0;
+	int    pageoffset;
+	size_t prev_ix;
 	size_t next_ix;
 
 	int    cipher_active, digest_active, csum_active;
-- 
2.9.3

