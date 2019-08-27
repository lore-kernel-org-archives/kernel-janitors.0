From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 27 Aug 2019 12:42:27 +0000
Subject: [PATCH 1/2] powerpc/pseries: Delete an unnecessary kfree() call in dlpar_store()
Message-Id: <b46cc4ff-a14c-0c10-0c0c-95573a960178@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
In-Reply-To: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Frank Rowand <frank.rowand@sony.com>, Gen Zhang <blackgod016574@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 13:34:02 +0200

A null pointer would be passed to a call of the function “kfree”
immediately after a call of the function “kstrdup” failed at one place.
Remove this superfluous function call.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/pseries/dlpar.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 16e86ba8aa20..2a783dc0cfa7 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -523,7 +523,6 @@ static ssize_t dlpar_store(struct class *class, struct class_attribute *attr,
 	args = argbuf = kstrdup(buf, GFP_KERNEL);
 	if (!argbuf) {
 		pr_info("Could not allocate resources for DLPAR operation\n");
-		kfree(argbuf);
 		return -ENOMEM;
 	}

--
2.23.0
