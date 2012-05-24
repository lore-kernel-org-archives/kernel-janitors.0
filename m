From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 May 2012 10:28:51 +0000
Subject: [patch] staging: comedi: cleanup comedi_recognize()
Message-Id: <20120524102851.GA4399@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This function is more complicated than it needs to be because of the
consts.  It's not worth saving them because we drop the consts anyway
when we return (void *)name_ptr.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers.c b/drivers/staging/comedi/drivers.c
index 1c3d638..a8f576d 100644
--- a/drivers/staging/comedi/drivers.c
+++ b/drivers/staging/comedi/drivers.c
@@ -304,14 +304,13 @@ static int postconfig(struct comedi_device *dev)
  * that register their supported board names */
 static void *comedi_recognize(struct comedi_driver *driv, const char *name)
 {
-	unsigned i;
-	const char *const *name_ptr = driv->board_name;
+	char **name_ptr = (char **)driv->board_name;
+	int i;
+
 	for (i = 0; i < driv->num_names; i++) {
 		if (strcmp(*name_ptr, name) = 0)
-			return (void *)name_ptr;
-		name_ptr -		    (const char *const *)((const char *)name_ptr +
-					  driv->offset);
+			return name_ptr;
+		name_ptr = (char **)((void *)name_ptr + driv->offset);
 	}
 
 	return NULL;
