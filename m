From: Julia Lawall <julia@diku.dk>
Date: Wed, 09 Dec 2009 19:25:04 +0000
Subject: [PATCH 9/12] drivers/staging: Correct size given to memset
Message-Id: <Pine.LNX.4.64.0912092024480.1870@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Memset should be given the size of the structure, not the size of the pointer.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *x;
expression E;
@@

memset(x, E, sizeof(
+ *
 x))
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/wlan-ng/prism2fw.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -439,7 +439,7 @@ void free_chunks(imgchunk_t *fchunk, uns
 		}
 	}
 	*nfchunks = 0;
-	memset(fchunk, 0, sizeof(fchunk));
+	memset(fchunk, 0, sizeof(*fchunk));
 
 }
 
