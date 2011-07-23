From: Dan Carpenter <error27@gmail.com>
Date: Sat, 23 Jul 2011 18:53:03 +0000
Subject: [patch] [media] pwc: precedence bug in pwc_init_controls()
Message-Id: <20110723185303.GA3711@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans.verkuil@cisco.com>, =?iso-8859-1?Q?Jean-Fran=E7ois?= Moine <moinejf@free.fr>, "open list:MEDIA INPUT INFRA..." <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

'!' has higher precedence than '&' so we need parenthesis here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/pwc/pwc-v4l.c b/drivers/media/video/pwc/pwc-v4l.c
index e9a0e94..8c70e64 100644
--- a/drivers/media/video/pwc/pwc-v4l.c
+++ b/drivers/media/video/pwc/pwc-v4l.c
@@ -338,7 +338,7 @@ int pwc_init_controls(struct pwc_device *pdev)
 	if (pdev->restore_factory)
 		pdev->restore_factory->flags = V4L2_CTRL_FLAG_UPDATE;
 
-	if (!pdev->features & FEATURE_MOTOR_PANTILT)
+	if (!(pdev->features & FEATURE_MOTOR_PANTILT))
 		return hdl->error;
 
 	/* Motor pan / tilt / reset */
