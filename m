From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 07 Sep 2012 15:24:46 +0000
Subject: [PATCH 6/10] drivers/media/i2c/tea6415c.c: removes unnecessary semicolon
Message-Id: <1347031488-26598-8-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/i2c/tea6415c.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/media/i2c/tea6415c.c b/drivers/media/i2c/tea6415c.c
--- a/drivers/media/i2c/tea6415c.c
+++ b/drivers/media/i2c/tea6415c.c
@@ -81,7 +81,7 @@ static int tea6415c_s_routing(struct v4l
 	case 13:
 		byte = 0x28;
 		break;
-	};
+	}
 
 	switch (i) {
 	case 5:
@@ -108,7 +108,7 @@ static int tea6415c_s_routing(struct v4l
 	case 11:
 		byte |= 0x07;
 		break;
-	};
+	}
 
 	ret = i2c_smbus_write_byte(client, byte);
 	if (ret) {

