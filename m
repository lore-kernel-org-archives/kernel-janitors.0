From: Dan Carpenter <error27@gmail.com>
Date: Tue, 15 Feb 2011 10:10:08 +0000
Subject: [patch v2] [media] stv090x: handle allocation failures
Message-Id: <20110215101008.GO4384@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110207165650.GF4384@bicker>
 <201102150300.19650@orion.escape-edv.de>
In-Reply-To: <201102150300.19650@orion.escape-edv.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Endriss <o.endriss@gmx.de>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Manu Abraham <manu@linuxtv.org>, Andreas Regel <andreas.regel@gmx.de>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

kmalloc() can fail so check whether state->internal is NULL.
append_internal() can return NULL on allocation failures so check that.
Also if we hit the error condition later in the function then there is
a memory leak and we need to call remove_dev() to fix it.

Also Oliver Endriss pointed out an additional leak that I missed in the
first version of this patch.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2:  Fix the leak Oliver noticed.

diff --git a/drivers/media/dvb/frontends/stv090x.c b/drivers/media/dvb/frontends/stv090x.c
index d3362d0..41d0f0a 100644
--- a/drivers/media/dvb/frontends/stv090x.c
+++ b/drivers/media/dvb/frontends/stv090x.c
@@ -4783,7 +4783,13 @@ struct dvb_frontend *stv090x_attach(const struct stv090x_config *config,
 	} else {
 		state->internal = kmalloc(sizeof(struct stv090x_internal),
 					  GFP_KERNEL);
+		if (!state->internal)
+			goto error;
 		temp_int = append_internal(state->internal);
+		if (!temp_int) {
+			kfree(state->internal);
+			goto error;
+		}
 		state->internal->num_used = 1;
 		state->internal->mclk = 0;
 		state->internal->dev_ver = 0;
@@ -4796,7 +4802,7 @@ struct dvb_frontend *stv090x_attach(const struct stv090x_config *config,
 
 		if (stv090x_setup(&state->frontend) < 0) {
 			dprintk(FE_ERROR, 1, "Error setting up device");
-			goto error;
+			goto err_remove;
 		}
 	}
 
@@ -4811,6 +4817,9 @@ struct dvb_frontend *stv090x_attach(const struct stv090x_config *config,
 
 	return &state->frontend;
 
+err_remove:
+	remove_dev(state->internal);
+	kfree(state->internal);
 error:
 	kfree(state);
 	return NULL;
