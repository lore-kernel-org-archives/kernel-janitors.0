From: Julia Lawall <julia@diku.dk>
Date: Tue, 25 Nov 2008 13:14:32 +0000
Subject: [PATCH 3/5] fs/9p: change simple_strtol to simple_strtoul
Message-Id: <Pine.LNX.4.64.0811251413050.11897@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ericvh@gmail.com, rminnich@sandia.gov, lucho@ionkov.net, v9fs-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Since v9ses->uid is unsigned, it would seem better to use simple_strtoul that
simple_strtol.

A simplified version of the semantic patch that makes this change is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r2@
long e;
position p;
@@

e = simple_strtol@p(...)

@@
position p != r2.p;
type T;
T e;
@@

e = 
- simple_strtol@p
+ simple_strtoul
  (...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

 fs/9p/v9fs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/fs/9p/v9fs.c b/fs/9p/v9fs.c
--- a/fs/9p/v9fs.c
+++ b/fs/9p/v9fs.c
@@ -160,7 +160,7 @@ static int v9fs_parse_options(struct v9f
 				v9ses->flags |= V9FS_ACCESS_ANY;
 			else {
 				v9ses->flags |= V9FS_ACCESS_SINGLE;
-				v9ses->uid = simple_strtol(s, &e, 10);
+				v9ses->uid = simple_strtoul(s, &e, 10);
 				if (*e != '\0')
 					v9ses->uid = ~0;
 			}
