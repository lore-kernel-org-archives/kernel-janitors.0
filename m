From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 May 2017 21:27:18 +0000
Subject: [PATCH] staging: speakup: signedness bug in spk_ttyio_in_nowait()
Message-Id: <20170519212718.3pa52aiihtk4o6t2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On most of the common arches char is signed so it can't ever = 0xff.
Let's fix this by making it a u8.

Fixes: 6b9ad1c742bf ("staging: speakup: add send_xchar, tiocmset and input functionality for tty")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/speakup/spk_ttyio.c b/drivers/staging/speakup/spk_ttyio.c
index 6e0f042f6a44..8ed7c71c712f 100644
--- a/drivers/staging/speakup/spk_ttyio.c
+++ b/drivers/staging/speakup/spk_ttyio.c
@@ -220,7 +220,7 @@ static unsigned char spk_ttyio_in(void)
 
 static unsigned char spk_ttyio_in_nowait(void)
 {
-	char rv = ttyio_in(0);
+	u8 rv = ttyio_in(0);
 
 	return (rv = 0xff) ? 0 : rv;
 }
