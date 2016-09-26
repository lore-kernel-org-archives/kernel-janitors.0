From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Sep 2016 15:43:22 +0000
Subject: [PATCH 4/5] ISDN-Gigaset: Release memory in gigaset_initcs() after an allocation failure
Message-Id: <6409b3b0-3b7a-1139-f040-7b1a61611187@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
In-Reply-To: <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, Paul Bolle <pebolle@tiscali.nl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Sep 2016 16:30:50 +0200

Memory was not released (as it would be expected) when one call
of further resource reservations failed.

* Split a condition check for memory allocation failures so that
  each pointer from these function calls will be checked immediately.

  See also background information:
  Topic "CWE-754: Improper check for unusual or exceptional conditions"
  Link: https://cwe.mitre.org/data/definitions/754.html

* Adjust jump targets according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/isdn/gigaset/common.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/isdn/gigaset/common.c b/drivers/isdn/gigaset/common.c
index c05a2a4..2e9382f 100644
--- a/drivers/isdn/gigaset/common.c
+++ b/drivers/isdn/gigaset/common.c
@@ -710,10 +710,13 @@ struct cardstate *gigaset_initcs(struct gigaset_driver *drv, int channels,
 	cs->mode = M_UNKNOWN;
 	cs->mstate = MS_UNINITIALIZED;
 	cs->bcs = kmalloc_array(channels, sizeof(*cs->bcs), GFP_KERNEL);
+	if (!cs->bcs)
+		goto report_failure;
+
 	cs->inbuf = kmalloc(sizeof(*cs->inbuf), GFP_KERNEL);
-	if (!cs->bcs || !cs->inbuf) {
-		goto error;
-	}
+	if (!cs->inbuf)
+		goto free_bcs;
+
 	++cs->cs_init;
 
 	gig_dbg(DEBUG_INIT, "setting up at_state");
@@ -737,14 +740,14 @@ struct cardstate *gigaset_initcs(struct gigaset_driver *drv, int channels,
 	gig_dbg(DEBUG_INIT, "setting up iif");
 	if (gigaset_isdn_regdev(cs, modulename) < 0) {
 		pr_err("error registering ISDN device\n");
-		goto error;
+		goto free_bcs;
 	}
 
 	make_valid(cs, VALID_ID);
 	++cs->cs_init;
 	gig_dbg(DEBUG_INIT, "setting up hw");
 	if (cs->ops->initcshw(cs) < 0)
-		goto error;
+		goto free_bcs;
 
 	++cs->cs_init;
 
@@ -759,7 +762,7 @@ struct cardstate *gigaset_initcs(struct gigaset_driver *drv, int channels,
 		gig_dbg(DEBUG_INIT, "setting up bcs[%d]", i);
 		if (gigaset_initbcs(cs->bcs + i, cs, i) < 0) {
 			pr_err("could not allocate channel %d data\n", i);
-			goto error;
+			goto free_bcs;
 		}
 	}
 
@@ -772,8 +775,9 @@ struct cardstate *gigaset_initcs(struct gigaset_driver *drv, int channels,
 
 	gig_dbg(DEBUG_INIT, "cs initialized");
 	return cs;
-
-error:
+free_bcs:
+	kfree(cs->bcs);
+report_failure:
 	gig_dbg(DEBUG_INIT, "failed");
 	gigaset_freecs(cs);
 	return NULL;
-- 
2.10.0

