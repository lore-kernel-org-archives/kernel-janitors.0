From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 27 Aug 2019 12:44:36 +0000
Subject: [PATCH 2/2] powerpc/pseries: Delete an error message for a failed string duplication in dlpar_store(
Message-Id: <535cfec2-782f-61ec-f6fb-c50186ead2af@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
In-Reply-To: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Frank Rowand <frank.rowand@sony.com>, Gen Zhang <blackgod016574@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 13:37:56 +0200

Omit an extra message for a memory allocation failure in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/pseries/dlpar.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 2a783dc0cfa7..deb48b41d488 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -521,10 +521,8 @@ static ssize_t dlpar_store(struct class *class, struct class_attribute *attr,
 	int rc;

 	args = argbuf = kstrdup(buf, GFP_KERNEL);
-	if (!argbuf) {
-		pr_info("Could not allocate resources for DLPAR operation\n");
+	if (!argbuf)
 		return -ENOMEM;
-	}

 	/*
 	 * Parse out the request from the user, this will be in the form:
--
2.23.0
