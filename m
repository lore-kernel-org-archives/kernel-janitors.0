From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 22 Nov 2014 14:39:16 +0000
Subject: [PATCH 3/6] HSI: nokia-modem: fix error return code
Message-Id: <1416667159-9808-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416667159-9808-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416667159-9808-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Return a negative error code on failure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
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
 drivers/hsi/clients/nokia-modem.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hsi/clients/nokia-modem.c b/drivers/hsi/clients/nokia-modem.c
index f0c2145..e07009a 100644
--- a/drivers/hsi/clients/nokia-modem.c
+++ b/drivers/hsi/clients/nokia-modem.c
@@ -199,6 +199,7 @@ static int nokia_modem_probe(struct device *dev)
 	modem->ssi_protocol = hsi_new_client(port, &ssip);
 	if (!modem->ssi_protocol) {
 		dev_err(dev, "Could not register ssi-protocol device\n");
+		err = -ENOMEM;
 		goto error2;
 	}
 

