From: Julia Lawall <julia@diku.dk>
Date: Tue, 16 Dec 2008 15:15:53 +0000
Subject: [PATCH 11/11] net/bridge/netfilter: Move a dereference below a NULL
Message-Id: <Pine.LNX.4.64.0812161615320.20444@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaber@trash.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, if the NULL test is necessary, then the dereference should be
moved below the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/bridge/netfilter/ebtables.c     |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index 0fa208e..1616884 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -86,12 +86,13 @@ static inline int ebt_do_match (struct ebt_entry_match *m,
 static inline int ebt_dev_check(char *entry, const struct net_device *device)
 {
 	int i = 0;
-	const char *devname = device->name;
+	const char *devname;
 
 	if (*entry = '\0')
 		return 0;
 	if (!device)
 		return 1;
+	devname = device->name;
 	/* 1 is the wildcard token */
 	while (entry[i] != '\0' && entry[i] != 1 && entry[i] = devname[i])
 		i++;
