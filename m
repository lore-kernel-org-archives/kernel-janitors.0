From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 17 May 2016 14:38:42 +0000
Subject: [PATCH 3/7] [media] mn88472: fix typo
Message-Id: <1463495926-13728-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1463495926-13728-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1463495926-13728-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Palosaari <crope@iki.fi>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

firmare -> firmware

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/media/mn88472/mn88472.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/mn88472/mn88472.c b/drivers/staging/media/mn88472/mn88472.c
index 7ea749c..5cfa22a 100644
--- a/drivers/staging/media/mn88472/mn88472.c
+++ b/drivers/staging/media/mn88472/mn88472.c
@@ -312,7 +312,7 @@ static int mn88472_init(struct dvb_frontend *fe)
 	/* request the firmware, this will block and timeout */
 	ret = request_firmware(&fw, fw_file, &client->dev);
 	if (ret) {
-		dev_err(&client->dev, "firmare file '%s' not found\n",
+		dev_err(&client->dev, "firmware file '%s' not found\n",
 				fw_file);
 		goto err;
 	}

