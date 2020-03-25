From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 25 Mar 2020 07:04:52 +0000
Subject: [PATCH 2/2] SUNRPC: Optimize 'svc_print_xprts()'
Message-Id: <20200325070452.22043-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trond.myklebust@hammerspace.com, anna.schumaker@netapp.com, bfields@fieldses.org, chuck.lever@oracle.com, davem@davemloft.net, kuba@kernel.org, gnb@sgi.com, neilb@suse.de, tom@opengridcomputing.com
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Using 'snprintf' is safer than 'sprintf' because it can avoid a buffer
overflow.
The return value can also be used to avoid a strlen a call.

Finally, we know where we need to copy and the length to copy, so, we
can save a few cycles by rearraging the code and using a memcpy instead of
a strcat.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch should have no functionnal change.
We could go further, use scnprintf and write directly in the destination
buffer. However, this could lead to a truncated last line.
---
 net/sunrpc/svc_xprt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
index df39e7b8b06c..6df861650040 100644
--- a/net/sunrpc/svc_xprt.c
+++ b/net/sunrpc/svc_xprt.c
@@ -118,12 +118,12 @@ int svc_print_xprts(char *buf, int maxlen)
 	list_for_each_entry(xcl, &svc_xprt_class_list, xcl_list) {
 		int slen;
 
-		sprintf(tmpstr, "%s %d\n", xcl->xcl_name, xcl->xcl_max_payload);
-		slen = strlen(tmpstr);
-		if (len + slen >= maxlen)
+		slen = snprintf(tmpstr, sizeof(tmpstr), "%s %d\n",
+				xcl->xcl_name, xcl->xcl_max_payload);
+		if (slen >= sizeof(tmpstr) || len + slen >= maxlen)
 			break;
+		memcpy(buf + len, tmpstr, slen + 1);
 		len += slen;
-		strcat(buf, tmpstr);
 	}
 	spin_unlock(&svc_xprt_class_lock);
 
-- 
2.20.1
