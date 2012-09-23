From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Sun, 23 Sep 2012 17:39:21 +0000
Subject: Fwd: [PATCH 5/5] drivers/media/platform/omap3isp/isp.c: fix error return code
Message-Id: <505F4949.2090509@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090503090104080708050501"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346775269-12191-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346775269-12191-1-git-send-email-peter.senna@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Senna Tschudin <peter.senna@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------090503090104080708050501
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Laurent,

Could you please review this patch?

Peter,

Please, always c/c the driver maintainer/author on patches you submit.

You can check it with scripts/get_maintainer.pl.

Regards,
Mauro

-------- Mensagem original --------
Assunto: [PATCH 5/5] drivers/media/platform/omap3isp/isp.c: fix error return code
Data: Tue,  4 Sep 2012 18:14:25 +0200
De: Peter Senna Tschudin <peter.senna@gmail.com>
Para: Mauro Carvalho Chehab <mchehab@infradead.org>
CC: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

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

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/platform/omap3isp/isp.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index e0096e0..91fcaef 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2102,8 +2102,10 @@ static int __devinit isp_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error;
 
-	if (__omap3isp_get(isp, false) == NULL)
+	if (__omap3isp_get(isp, false) == NULL) {
+		ret = -EBUSY; /* Not sure if EBUSY is best for here */
 		goto error;
+	}
 
 	ret = isp_reset(isp);
 	if (ret < 0)

--
To unsubscribe from this list: send the line "unsubscribe linux-media" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



--------------090503090104080708050501
Content-Type: text/plain; charset=UTF-8;
 name="=?ISO-8859-1?Q?Se=E7=E3o_da_mensagem_anexada?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename*0*=ISO-8859-1''%53%65%E7%E3%6F%20%64%61%20%6D%65%6E%73%61%67%65;
 filename*1*=%6D%20%61%6E%65%78%61%64%61


--------------090503090104080708050501--
