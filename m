From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Tue, 14 Oct 2008 18:33:24 +0000
Subject: [PATCH] : Fix compilation warnings in net/802/fc.c
Message-Id: <ea11fea30810141121w58e25b43x92d71ca800c5c96@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ I was not sure about which list is this appropriate, so putting
kernel-janitors since this is cleanup]

Below patch fixes the following warning during compilation.
net/802/fc.c:85: warning: unused variable 'fch'

Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>

---
 net/802/fc.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/net/802/fc.c b/net/802/fc.c
index cb3475e..7463109 100644
--- a/net/802/fc.c
+++ b/net/802/fc.c
@@ -82,7 +82,9 @@ static int fc_header(struct sk_buff *skb, struct
net_device *dev,

 static int fc_rebuild_header(struct sk_buff *skb)
 {
+#ifdef CONFIG_INET
 	struct fch_hdr *fch=(struct fch_hdr *)skb->data;
+#endif
 	struct fcllc *fcllc=(struct fcllc *)(skb->data+sizeof(struct fch_hdr));
 	if(fcllc->ethertype != htons(ETH_P_IP)) {
 		printk("fc_rebuild_header: Don't know how to resolve type %04X
addresses ?\n", ntohs(fcllc->ethertype));
-- 
1.5.4.3


Thanks -
Manish
