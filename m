From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 22 Nov 2014 14:39:14 +0000
Subject: [PATCH 1/6] NFC: pn533: fix error return code
Message-Id: <1416667159-9808-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416667159-9808-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416667159-9808-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: kernel-janitors@vger.kernel.org, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

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
The error code is chosen according to the other call to this function
in the same file.

 drivers/nfc/pn533.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533.c b/drivers/nfc/pn533.c
index d46a700..a859303 100644
--- a/drivers/nfc/pn533.c
+++ b/drivers/nfc/pn533.c
@@ -2554,8 +2554,10 @@ static int pn533_data_exchange_complete(struct pn533 *dev, void *_arg,
 	}
 
 	skb = pn533_build_response(dev);
-	if (!skb)
+	if (!skb) {
+		rc = -EIO;
 		goto error;
+	}
 
 	arg->cb(arg->cb_context, skb, 0);
 	kfree(arg);

