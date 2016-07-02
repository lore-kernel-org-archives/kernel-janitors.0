From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 02 Jul 2016 06:24:48 +0000
Subject: [PATCH 2/2] nfsd: remove extraneous KERN_INFO prefix
Message-Id: <1467440688-8368-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jlayton@poochiereds.net, bfields@fieldses.org
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

smatch complains about using KERN_INFO as a prefix when calling dprintk

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/nfsd/nfs4state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index bc2173a..ba6b2df 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -2226,7 +2226,7 @@ gen_callback(struct nfs4_client *clp, struct nfsd4_setclientid *se, struct svc_r
 out_err:
 	conn->cb_addr.ss_family = AF_UNSPEC;
 	conn->cb_addrlen = 0;
-	dprintk(KERN_INFO "NFSD: this client (clientid %08x/%08x) "
+	dprintk("NFSD: this client (clientid %08x/%08x) "
 		"will not receive delegations\n",
 		clp->cl_clientid.cl_boot, clp->cl_clientid.cl_id);
 
-- 
2.7.4

