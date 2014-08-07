From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 07 Aug 2014 12:49:06 +0000
Subject: [PATCH 3/5] drivers/atm/atmtcp.c: fix error return code
Message-Id: <1407415749-19978-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <chas@cmf.nrl.navy.mil>
Cc: kernel-janitors@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a zero return value on error to a negative one, as returned
elsewhere in the function.

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
Another return value could be more appropriate.

 drivers/atm/atmtcp.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/atm/atmtcp.c b/drivers/atm/atmtcp.c
index 0e3f8f9..c8e4fb4 100644
--- a/drivers/atm/atmtcp.c
+++ b/drivers/atm/atmtcp.c
@@ -299,6 +299,7 @@ static int atmtcp_c_send(struct atm_vcc *vcc,struct sk_buff *skb)
 	out_vcc = find_vcc(dev, ntohs(hdr->vpi), ntohs(hdr->vci));
 	read_unlock(&vcc_sklist_lock);
 	if (!out_vcc) {
+		result = -ESRCH;
 		atomic_inc(&vcc->stats->tx_err);
 		goto done;
 	}

