From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Apr 2013 19:20:40 +0000
Subject: [patch 1/2] [media] r820t: precendence bug in r820t_xtal_check()
Message-Id: <20130418192040.GA17798@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, kbuild@01.org

The test as written is always false.  It looks like the intent was to
test that the bit was not set.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/tuners/r820t.c b/drivers/media/tuners/r820t.c
index 905a106..ba033fd 100644
--- a/drivers/media/tuners/r820t.c
+++ b/drivers/media/tuners/r820t.c
@@ -1378,7 +1378,7 @@ static int r820t_xtal_check(struct r820t_priv *priv)
 		rc = r820t_read(priv, 0x00, data, sizeof(data));
 		if (rc < 0)
 			return rc;
-		if ((!data[2]) & 0x40)
+		if (!(data[2] & 0x40))
 			continue;
 
 		val = data[2] & 0x3f;
