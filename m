From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 07 Aug 2014 20:57:46 +0000
Subject: [PATCH 3/4] block: fix error return code
Message-Id: <1407445067-4044-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407445067-4044-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407445067-4044-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joshua Morris <josh.h.morris@us.ibm.com>
Cc: kernel-janitors@vger.kernel.org, Philip Kelleher <pjk1939@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org

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
 drivers/block/rsxx/core.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
index a8de2ee..fa8077a 100644
--- a/drivers/block/rsxx/core.c
+++ b/drivers/block/rsxx/core.c
@@ -942,6 +942,7 @@ static int rsxx_pci_probe(struct pci_dev *dev,
 	card->event_wq = create_singlethread_workqueue(DRIVER_NAME"_event");
 	if (!card->event_wq) {
 		dev_err(CARD_TO_DEV(card), "Failed card event setup.\n");
+		st = -ENOMEM;
 		goto failed_event_handler;
 	}
 
