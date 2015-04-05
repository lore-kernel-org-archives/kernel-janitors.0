From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 05 Apr 2015 12:06:26 +0000
Subject: [PATCH 6/16] HSI: cmt_speech: fix error return code
Message-Id: <1428235596-4757-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/hsi/clients/cmt_speech.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hsi/clients/cmt_speech.c b/drivers/hsi/clients/cmt_speech.c
index e9560ef..4983529 100644
--- a/drivers/hsi/clients/cmt_speech.c
+++ b/drivers/hsi/clients/cmt_speech.c
@@ -1028,6 +1028,7 @@ static int cs_hsi_start(struct cs_hsi_iface **hi, struct hsi_client *cl,
 	}
 	hsi_if->master = ssip_slave_get_master(cl);
 	if (IS_ERR(hsi_if->master)) {
+		err = PTR_ERR(hsi_if->master);
 		dev_err(&cl->device, "Could not get HSI master client\n");
 		goto leave4;
 	}

