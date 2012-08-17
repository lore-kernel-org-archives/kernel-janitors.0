From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 17 Aug 2012 07:46:58 +0000
Subject: [PATCH 3/3] drivers/net/irda: fix error return code
Message-Id: <1345189618-13758-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345189618-13758-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345189618-13758-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <samuel@sortiz.org>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret;
expression e1,e2;
@@

if (ret < 0)
 { ... return ret; }
 ... when != ret = e1
     when forall
*if(...)
 {
  ... when != ret = e2
* return ret;
 }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/irda/ks959-sir.c    |    1 +
 drivers/net/irda/ksdazzle-sir.c |    1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/irda/ks959-sir.c b/drivers/net/irda/ks959-sir.c
index 824e2a9..5f3aeac 100644
--- a/drivers/net/irda/ks959-sir.c
+++ b/drivers/net/irda/ks959-sir.c
@@ -542,6 +542,7 @@ static int ks959_net_open(struct net_device *netdev)
 	sprintf(hwname, "usb#%d", kingsun->usbdev->devnum);
 	kingsun->irlap = irlap_open(netdev, &kingsun->qos, hwname);
 	if (!kingsun->irlap) {
+		err = -ENOMEM;
 		dev_err(&kingsun->usbdev->dev, "irlap_open failed\n");
 		goto free_mem;
 	}
diff --git a/drivers/net/irda/ksdazzle-sir.c b/drivers/net/irda/ksdazzle-sir.c
index 5a278ab..2d4b6a1 100644
--- a/drivers/net/irda/ksdazzle-sir.c
+++ b/drivers/net/irda/ksdazzle-sir.c
@@ -436,6 +436,7 @@ static int ksdazzle_net_open(struct net_device *netdev)
 	sprintf(hwname, "usb#%d", kingsun->usbdev->devnum);
 	kingsun->irlap = irlap_open(netdev, &kingsun->qos, hwname);
 	if (!kingsun->irlap) {
+		err = -ENOMEM;
 		dev_err(&kingsun->usbdev->dev, "irlap_open failed\n");
 		goto free_mem;
 	}

