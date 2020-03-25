From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 25 Mar 2020 07:04:40 +0000
Subject: [PATCH 1/2] SUNRPC: Fix a potential buffer overflow in 'svc_print_xprts()'
Message-Id: <20200325070440.21988-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trond.myklebust@hammerspace.com, anna.schumaker@netapp.com, bfields@fieldses.org, chuck.lever@oracle.com, davem@davemloft.net, kuba@kernel.org, gnb@sgi.com, neilb@suse.de, tom@opengridcomputing.com
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'maxlen' is the total size of the destination buffer. There is only one
caller and this value is 256.

When we compute the size already used and what we would like to add in
the buffer, the trailling NULL character is not taken into account.
However, this trailling character will be added by the 'strcat' once we
have checked that we have enough place.

So, there is a off-by-one issue and 1 byte of the stack could be
erroneously overwridden.

Take into account the trailling NULL, when checking if there is enough
place in the destination buffer.

Fixes: dc9a16e49dbba ("svc: Add /proc/sys/sunrpc/transport files")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/sunrpc/svc_xprt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
index d53259346235..df39e7b8b06c 100644
--- a/net/sunrpc/svc_xprt.c
+++ b/net/sunrpc/svc_xprt.c
@@ -120,7 +120,7 @@ int svc_print_xprts(char *buf, int maxlen)
 
 		sprintf(tmpstr, "%s %d\n", xcl->xcl_name, xcl->xcl_max_payload);
 		slen = strlen(tmpstr);
-		if (len + slen > maxlen)
+		if (len + slen >= maxlen)
 			break;
 		len += slen;
 		strcat(buf, tmpstr);
-- 
2.20.1
