From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Dec 2013 21:57:32 +0000
Subject: [PATCH 17/25]  fix error return code
Message-Id: <1388357260-4843-16-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Set the return variable to an error code as done elsewhere in the function.

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

 drivers/char/xilinx_hwicap/xilinx_hwicap.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index f6345f9..9b1a5ac 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -661,6 +661,7 @@ static int hwicap_setup(struct device *dev, int id,
 	drvdata->base_address = ioremap(drvdata->mem_start, drvdata->mem_size);
 	if (!drvdata->base_address) {
 		dev_err(dev, "ioremap() failed\n");
+		retval = -ENOMEM;
 		goto failed2;
 	}
 

