From: Julia Lawall <julia@diku.dk>
Date: Fri, 01 Apr 2011 14:23:44 +0000
Subject: [PATCH 3/6] drivers/staging/cx25821/cx25821-video.c: introduce missing kfree
Message-Id: <1301667827-20056-3-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, Hans Verkuil <hverkuil@xs4all.nl>, Palash Bandyopadhyay <palash.bandyopadhyay@conexant.com>, Andreas Bombe <aeb@debian.org>, Joe Perches <joe@perches.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Error handling code following a kmalloc should free the allocated data.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,f1,l;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...x...+> }
(
x->f1 = E
|
 (x->f1 = NULL || ...)
|
 f(...,x->f1,...)
)
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/cx25821/cx25821-video.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/cx25821/cx25821-video.c b/drivers/staging/cx25821/cx25821-video.c
index ab05392..04b18f4 100644
--- a/drivers/staging/cx25821/cx25821-video.c
+++ b/drivers/staging/cx25821/cx25821-video.c
@@ -832,6 +832,7 @@ static int video_open(struct file *file)
 
        if (NULL = dev) {
 		mutex_unlock(&cx25821_devlist_mutex);
+		kfree(fh);
 		return -ENODEV;
        }
 

