From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 18 Aug 2005 21:33:18 +0000
Subject: [KJ] [PATCH] pktgen: remove useless assignment
Message-Id: <20050818213318.GA4483@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99236792042538213=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99236792042538213==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On main codepath pkt_dev is immediately rewritten. On error codepath it isn't
used.

Noticed by Coverity checker.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 net/core/pktgen.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

--- linux-vanilla/net/core/pktgen.c
+++ linux-coverity-1762/net/core/pktgen.c
@@ -2882,7 +2882,7 @@ static int pktgen_add_device(struct pktg
 	
 	/* We don't allow a device to be on several threads */
 
-	if( (pkt_dev = __pktgen_NN_threads(ifname, FIND)) == NULL) {
+	if(__pktgen_NN_threads(ifname, FIND) == NULL) {
 						   
 		pkt_dev = kmalloc(sizeof(struct pktgen_dev), GFP_KERNEL);
                 if (!pkt_dev) 


--===============99236792042538213==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99236792042538213==--
