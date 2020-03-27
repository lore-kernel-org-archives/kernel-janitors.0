From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 27 Mar 2020 16:15:39 +0000
Subject: [PATCH V2] SUNRPC: Fix a potential buffer overflow in 'svc_print_xprts()'
Message-Id: <20200327161539.21554-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bfields@fieldses.org, chuck.lever@oracle.com, trond.myklebust@hammerspace.com, anna.schumaker@netapp.com, davem@davemloft.net, kuba@kernel.org, neilb@suse.de, tom@opengridcomputing.com, gnb@sgi.com
Cc: linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

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


While at it, also replace a 'sprintf' by a safer 'snprintf', check for
output truncation and avoid a superfluous 'strlen'.

Fixes: dc9a16e49dbba ("svc: Add /proc/sys/sunrpc/transport files")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
V2: add a doxygen comment to clarify the goal of the function
    merge previous 2 patches into a single one
    keep strcat for clarity, this function being just a slow path anyway

Doc being most of the time a matter of taste, please adjust the description
as needed.
---
 net/sunrpc/svc_xprt.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
index de3c077733a7..e0f61a8c1965 100644
--- a/net/sunrpc/svc_xprt.c
+++ b/net/sunrpc/svc_xprt.c
@@ -104,8 +104,17 @@ void svc_unreg_xprt_class(struct svc_xprt_class *xcl)
 }
 EXPORT_SYMBOL_GPL(svc_unreg_xprt_class);
 
-/*
- * Format the transport list for printing
+/**
+ * svc_print_xprts - Format the transport list for printing
+ * @buf: target buffer for formatted address
+ * @maxlen: length of target buffer
+ *
+ * Fills in @buf with a string containing a list of transport names, each name
+ * terminated with '\n'. If the buffer is too small, some entries may be
+ * missing, but it is guaranteed that the line in the output buffer are
+ * complete.
+ *
+ * Returns positive length of the filled-in string.
  */
 int svc_print_xprts(char *buf, int maxlen)
 {
@@ -118,9 +127,9 @@ int svc_print_xprts(char *buf, int maxlen)
 	list_for_each_entry(xcl, &svc_xprt_class_list, xcl_list) {
 		int slen;
 
-		sprintf(tmpstr, "%s %d\n", xcl->xcl_name, xcl->xcl_max_payload);
-		slen = strlen(tmpstr);
-		if (len + slen > maxlen)
+		slen = snprintf(tmpstr, sizeof(tmpstr), "%s %d\n",
+				xcl->xcl_name, xcl->xcl_max_payload);
+		if (slen >= sizeof(tmpstr) || len + slen >= maxlen)
 			break;
 		len += slen;
 		strcat(buf, tmpstr);
-- 
2.20.1
