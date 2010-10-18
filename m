From: Julia Lawall <julia@diku.dk>
Date: Mon, 18 Oct 2010 14:11:13 +0000
Subject: [PATCH 1/2] sound/soc/davinci/davinci-mcasp.c: Return error code in failure
Message-Id: <1287411074-19825-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287411061.3303.211.camel@odin>
In-Reply-To: <1287411061.3303.211.camel@odin>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

In this code, 0 is returned on failure, even though other
failures return -ENOMEM or other similar values.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@a@
identifier alloc;
identifier ret;
constant C;
expression x;
@@

x = alloc(...);
if (x = NULL) { <+... \(ret = -C; \| return -C; \) ...+> }

@@
identifier f, a.alloc;
expression ret;
expression x,e1,e2,e3;
@@

ret = 0
... when != ret = e1
*x = alloc(...)
... when != ret = e2
if (x = NULL) { ... when != ret = e3
  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
Another call to platform_get_resource in the same function returns -ENODEV
on error, so I have used that value.

 sound/soc/davinci/davinci-mcasp.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/davinci/davinci-mcasp.c b/sound/soc/davinci/davinci-mcasp.c
index c8e97dc..86918ee 100644
--- a/sound/soc/davinci/davinci-mcasp.c
+++ b/sound/soc/davinci/davinci-mcasp.c
@@ -898,6 +898,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
 	if (!res) {
 		dev_err(&pdev->dev, "no DMA resource\n");
+		ret = -ENODEV;
 		goto err_release_region;
 	}
 
@@ -912,6 +913,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_DMA, 1);
 	if (!res) {
 		dev_err(&pdev->dev, "no DMA resource\n");
+		ret = -ENODEV;
 		goto err_release_region;
 	}
 

