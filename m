From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Jul 2016 11:36:38 +0000
Subject: [PATCH v2 3/3] xen-scsiback: Pass a failure indication as a constant
Message-Id: <b025aa24-63c9-4b2e-5035-9da278f968e5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <59e51c7d-f7bb-c55f-d2fe-06dccfef6a99@users.sourceforge.net>
 <87e55a72-71ad-d0a1-b936-12565bbc6508@users.sourceforge.net>
 <fb5824ad-fb09-e471-7dc4-3e32564cc334@suse.com>
 <8806e9cb-4200-8154-7914-6735805dfbe0@users.sourceforge.net>
 <83b0b1e2-900b-eefc-160b-7d837730571c@suse.com>
 <18256bfc-c6f9-8802-8d7d-55766f0b3624@users.sourceforge.net>
 <85b948e0-bf37-dff0-6792-77b5dacef9a0@suse.com>
 <6863b12b-9095-aaf3-6140-80968e0071e2@users.sourceforge.net>
In-Reply-To: <6863b12b-9095-aaf3-6140-80968e0071e2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, David Vrabel <david.vrabel@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Jul 2016 13:12:33 +0200

Pass the constant "FAILED" in a function call directly instead of
using an intialisation for a local variable.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
v2: Rebased on source files from "Linux next-20160719"

 drivers/xen/xen-scsiback.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index eb274df..fa08ec6 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -601,7 +601,7 @@ static void scsiback_device_action(struct vscsibk_pend *pending_req,
 	struct se_cmd *se_cmd = &pending_req->se_cmd;
 	struct scsiback_tmr *tmr;
 	u64 unpacked_lun = pending_req->v2p->lun;
-	int rc, err = FAILED;
+	int rc, err;
 
 	tmr = kzalloc(sizeof(struct scsiback_tmr), GFP_KERNEL);
 	if (!tmr)
@@ -628,7 +628,7 @@ put_cmd:
 	target_put_sess_cmd(se_cmd);
 free_tmr:
 	kfree(tmr);
-	scsiback_do_resp_with_sense(NULL, err, 0, pending_req);
+	scsiback_do_resp_with_sense(NULL, FAILED, 0, pending_req);
 }
 
 /*
-- 
2.9.2

