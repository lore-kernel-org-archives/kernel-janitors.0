From: Dan Carpenter <error27@gmail.com>
Date: Tue, 10 Aug 2010 05:36:24 +0000
Subject: [patch] Staging: ti-st: writing past end of array
Message-Id: <20100810053624.GN9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In the original source it would write past the end of the array before
returning the error code.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/ti-st/st_core.c b/drivers/staging/ti-st/st_core.c
index 063c9b1..0dfed21 100644
--- a/drivers/staging/ti-st/st_core.c
+++ b/drivers/staging/ti-st/st_core.c
@@ -686,9 +686,8 @@ long st_register(struct st_proto_s *new_proto)
 		default:
 			pr_err("%d protocol not supported",
 				   new_proto->type);
-			err = -EPROTONOSUPPORT;
-			/* something wrong */
-			break;
+			spin_unlock_irqrestore(&st_gdata->lock, flags);
+			return -EPROTONOSUPPORT;
 		}
 		st_gdata->list[new_proto->type] = new_proto;
 		st_gdata->protos_registered++;
