From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:58:59 +0000
Subject: [PATCH 01/12] staging: lustre: fid: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

!x is more normal for kzalloc failure in the kernel.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
statement S1, S2;
@@

x = kzalloc(...);
if (
- x = NULL
+ !x
 ) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/fid/fid_request.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/fid/fid_request.c b/drivers/staging/lustre/lustre/fid/fid_request.c
--- a/drivers/staging/lustre/lustre/fid/fid_request.c
+++ b/drivers/staging/lustre/lustre/fid/fid_request.c
@@ -498,11 +498,11 @@ int client_fid_init(struct obd_device *o
 	int rc;
 
 	cli->cl_seq = kzalloc(sizeof(*cli->cl_seq), GFP_NOFS);
-	if (cli->cl_seq = NULL)
+	if (!cli->cl_seq)
 		return -ENOMEM;
 
 	prefix = kzalloc(MAX_OBD_NAME + 5, GFP_NOFS);
-	if (prefix = NULL) {
+	if (!prefix) {
 		rc = -ENOMEM;
 		goto out_free_seq;
 	}

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
