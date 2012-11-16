From: Cyril Roelandt <tipecaml@gmail.com>
Date: Fri, 16 Nov 2012 22:17:01 +0000
Subject: [PATCH] staging/media/solo6x10/v4l2-enc.c: fix error-handling.
Message-Id: <1353104221-30176-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-media@vger.kernel.org, gregkh@linuxfoundation.org, mchehab@infradead.org, bcollins@bluecherry.net, Cyril Roelandt <tipecaml@gmail.com>

The return values of copy_to_user() and copy_from_user() cannot be negative.

Found using the following semantich patch:

<spml>
@exists@
identifier ret;
statement S;
expression E;
@@
(
* ret = copy_to_user(...);
|
* ret = copy_from_user(...);
)
... when != ret = E
    when != if (ret) { <+... ret = E; ...+> }
* if (ret < 0)
  S
</spml>

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/media/solo6x10/v4l2-enc.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/solo6x10/v4l2-enc.c b/drivers/staging/media/solo6x10/v4l2-enc.c
index f8f0da9..4977e86 100644
--- a/drivers/staging/media/solo6x10/v4l2-enc.c
+++ b/drivers/staging/media/solo6x10/v4l2-enc.c
@@ -1619,6 +1619,8 @@ static int solo_s_ext_ctrls(struct file *file, void *priv,
 				solo_enc->osd_text[OSD_TEXT_MAX] = '\0';
 				if (!err)
 					err = solo_osd_print(solo_enc);
+				else
+					err = -EFAULT;
 			}
 			break;
 		default:
@@ -1654,6 +1656,8 @@ static int solo_g_ext_ctrls(struct file *file, void *priv,
 				err = copy_to_user(ctrl->string,
 						   solo_enc->osd_text,
 						   OSD_TEXT_MAX);
+				if (err)
+					err = -EFAULT;
 			}
 			break;
 		default:
-- 
1.7.10.4

