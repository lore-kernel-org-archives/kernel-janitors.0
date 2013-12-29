From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Dec 2013 21:54:23 +0000
Subject: [PATCH 25/25]  fix error return code
Message-Id: <1388357260-4843-26-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The return variable is ret, not err, so initialize that to the error code.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Not tested.

 drivers/media/platform/davinci/vpbe.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpbe.c b/drivers/media/platform/davinci/vpbe.c
index 33b9660..a207278 100644
--- a/drivers/media/platform/davinci/vpbe.c
+++ b/drivers/media/platform/davinci/vpbe.c
@@ -653,7 +653,7 @@ static int vpbe_initialize(struct device *dev, struct vpbe_device *vpbe_dev)
 		if (err) {
 			v4l2_err(&vpbe_dev->v4l2_dev,
 				 "unable to initialize the OSD device");
-			err = -ENOMEM;
+			ret = -ENOMEM;
 			goto fail_dev_unregister;
 		}
 	}

