From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Oct 2017 10:45:03 +0000
Subject: [PATCH 05/10] staging/irda/net: Delete an unnecessary variable initialisation in irlap_recv_discover
Message-Id: <a7e40d8e-8dc6-63d4-a637-cec895e30408@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8152401b-d68d-c4fe-2619-82a09e0c52ec@users.sourceforge.net>
In-Reply-To: <8152401b-d68d-c4fe-2619-82a09e0c52ec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, netdev@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Corentin Labbe <clabbe.montjoie@gmail.com>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, Georgiana Chelu <georgiana.chelu93@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes.berg@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Samuel Ortiz <samuel@sortiz.org>, Srishti Sharma <srishtishar@gmail.com>, Stephen Hemminger <stephen@networkplumber.org>, Yuan Linyu <Linyu.Yuan@alcatel-sbell.com.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Oct 2017 22:20:22 +0200

The variable "discovery" will eventually be set to an appropriate pointer
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/irda/net/irlap_frame.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/irda/net/irlap_frame.c b/drivers/staging/irda/net/irlap_frame.c
index 33259ed5f3cd..5b8be5b9812e 100644
--- a/drivers/staging/irda/net/irlap_frame.c
+++ b/drivers/staging/irda/net/irlap_frame.c
@@ -408,7 +408,7 @@ static void irlap_recv_discovery_xid_rsp(struct irlap_cb *self,
 					 struct irlap_info *info)
 {
 	struct xid_frame *xid;
-	discovery_t *discovery = NULL;
+	discovery_t *discovery;
 	__u8 *discovery_info;
 	char *text;
 
-- 
2.14.2

