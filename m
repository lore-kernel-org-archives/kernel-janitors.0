From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 20 Dec 2015 11:15:52 +0000
Subject: [PATCH 3/4] s390/cio: add NULL test
Message-Id: <1450610153-7746-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450610153-7746-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450610153-7746-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: kernel-janitors@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org

Add NULL test on call to kzalloc.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
identifier fld;
@@

* x = kzalloc(...);
  ... when != x = NULL
  x->fld
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/s390/char/con3215.c |    2 ++
 1 files changed, 2 insertions(+)

diff --git a/drivers/s390/char/con3215.c b/drivers/s390/char/con3215.c
index 0fc3fe5..7d82bbc 100644
--- a/drivers/s390/char/con3215.c
+++ b/drivers/s390/char/con3215.c
@@ -922,6 +922,8 @@ static int __init con3215_init(void)
 	spin_lock_init(&raw3215_freelist_lock);
 	for (i = 0; i < NR_3215_REQ; i++) {
 		req = kzalloc(sizeof(struct raw3215_req), GFP_KERNEL | GFP_DMA);
+		if (!req)
+			return -ENOMEM;
 		req->next = raw3215_freelist;
 		raw3215_freelist = req;
 	}
