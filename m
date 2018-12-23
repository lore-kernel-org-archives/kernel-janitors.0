From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Dec 2018 08:57:08 +0000
Subject: [PATCH 13/20] xenbus: drop useless LIST_HEAD
Message-Id: <1545555435-24576-14-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org

Drop LIST_HEAD where the variable it declares is never used.

The declarations were introduced with the file, but the declared
variables were not used.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
@@
- LIST_HEAD(x);
  ... when != x
// </smpl>

Fixes: 1107ba885e46 ("xen: add xenfs to allow usermode <-> Xen interaction")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Successfully 0-day tested on 151 configurations.

 drivers/xen/xenbus/xenbus_dev_frontend.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_dev_frontend.c b/drivers/xen/xenbus/xenbus_dev_frontend.c
index c3e201025ef0..25c53545ea01 100644
--- a/drivers/xen/xenbus/xenbus_dev_frontend.c
+++ b/drivers/xen/xenbus/xenbus_dev_frontend.c
@@ -465,7 +465,6 @@ static int xenbus_write_watch(unsigned msg_type, struct xenbus_file_priv *u)
 	struct watch_adapter *watch;
 	char *path, *token;
 	int err, rc;
-	LIST_HEAD(staging_q);
 
 	path = u->u.buffer + sizeof(u->u.msg);
 	token = memchr(path, 0, u->u.msg.len);
@@ -523,7 +522,6 @@ static ssize_t xenbus_file_write(struct file *filp,
 	uint32_t msg_type;
 	int rc = len;
 	int ret;
-	LIST_HEAD(staging_q);
 
 	/*
 	 * We're expecting usermode to be writing properly formed
