From: Walter Harms <wharms@bfs.de>
Date: Thu, 15 Oct 2020 15:04:46 +0000
Subject: AW: [PATCH] net: sunrpc: Fix 'snprintf' return value check in 'do_xprt_debugfs'
Message-Id: <b97379d3bf59487d8d0ca3bbf14ad0df@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201015135341.GA16343@laptop>
In-Reply-To: <20201015135341.GA16343@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fedor Tokarev <ftokarev@gmail.com>, "bfields@fieldses.org" <bfields@fieldses.org>, "chuck.lever@oracle.com" <chuck.lever@oracle.com>, "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>, "trond.myklebust@hammerspace.com" <trond.myklebust@hammerspace.com>, "davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

if  xprt->debugfs->d_name.name can be what ever long
it is more clever to use kasprintf()
the some for link (no idea how many xprt als possible)

jm2c
 wh

________________________________________
Von: Fedor Tokarev [ftokarev@gmail.com]
Gesendet: Donnerstag, 15. Oktober 2020 15:59
An: bfields@fieldses.org; chuck.lever@oracle.com; anna.schumaker@netapp.com; trond.myklebust@hammerspace.com; davem@davemloft.net; kuba@kernel.org
Cc: linux-nfs@vger.kernel.org; netdev@vger.kernel.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org; ftokarev@gmail.com
Betreff: [PATCH] net: sunrpc: Fix 'snprintf' return value check in 'do_xprt_debugfs'

'snprintf' returns the number of characters which would have been written
if enough space had been available, excluding the terminating null byte.
Thus, the return value of 'sizeof(buf)' means that the last character
has been dropped.

Signed-off-by: Fedor Tokarev <ftokarev@gmail.com>
---
 net/sunrpc/debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sunrpc/debugfs.c b/net/sunrpc/debugfs.c
index fd9bca2..56029e3 100644
--- a/net/sunrpc/debugfs.c
+++ b/net/sunrpc/debugfs.c
@@ -128,13 +128,13 @@ static int do_xprt_debugfs(struct rpc_clnt *clnt, struct rpc_xprt *xprt, void *n
                return 0;
        len = snprintf(name, sizeof(name), "../../rpc_xprt/%s",
                       xprt->debugfs->d_name.name);
-       if (len > sizeof(name))
+       if (len >= sizeof(name))
                return -1;
        if (*nump == 0)
                strcpy(link, "xprt");
        else {
                len = snprintf(link, sizeof(link), "xprt%d", *nump);
-               if (len > sizeof(link))
+               if (len >= sizeof(link))
                        return -1;
        }
        debugfs_create_symlink(link, clnt->cl_debugfs, name);
--
2.7.4
