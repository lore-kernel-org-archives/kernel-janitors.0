From: Julia Lawall <julia@diku.dk>
Date: Thu, 04 Aug 2011 10:29:33 +0000
Subject: [PATCH 3/4] drivers/media/video/hexium_gemini.c: delete useless initialization
Message-Id: <1312453774-23333-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312453774-23333-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312453774-23333-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Jean Delvare <khali@linux-fr.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Delete nontrivial initialization that is immediately overwritten by the
result of an allocation function.

The semantic match that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
identifier i;
expression e;
@@

(
T i = \(0\|NULL\|ERR_PTR(...)\);
|
-T i = e;
+T i;
)
... when != i
i = \(kzalloc\|kcalloc\|kmalloc\)(...);

// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/hexium_gemini.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/media/video/hexium_gemini.c b/drivers/media/video/hexium_gemini.c
--- a/drivers/media/video/hexium_gemini.c
+++ b/drivers/media/video/hexium_gemini.c
@@ -352,7 +352,7 @@ static struct saa7146_ext_vv vv_data;
 /* this function only gets called when the probing was successful */
 static int hexium_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_data *info)
 {
-	struct hexium *hexium = (struct hexium *) dev->ext_priv;
+	struct hexium *hexium;
 	int ret;
 
 	DEB_EE((".\n"));

