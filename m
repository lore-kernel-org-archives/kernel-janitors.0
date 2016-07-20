From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Jul 2016 11:34:20 +0000
Subject: [PATCH v2 2/3] xen-scsiback: Rename jump labels in scsiback_device_action()
Message-Id: <639f00cc-5041-7ec0-b7f2-6ddb81129d15@users.sourceforge.net>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, David Vrabel <david.vrabel@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Jul 2016 13:03:16 +0200

* Adjust jump targets according to the Linux coding style convention.

* A bit of refactoring for the control flow

Suggested-by: J=FCrgen Gro=DF <jgross@suse.com>
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
v2: Rebased on source files from "Linux next-20160719"
    Changes from a bit of code review

 drivers/xen/xen-scsiback.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index 4a48c06..eb274df 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -604,10 +604,8 @@ static void scsiback_device_action(struct vscsibk_pend=
 *pending_req,
 	int rc, err =3D FAILED;
=20
 	tmr =3D kzalloc(sizeof(struct scsiback_tmr), GFP_KERNEL);
-	if (!tmr) {
-		target_put_sess_cmd(se_cmd);
-		goto err;
-	}
+	if (!tmr)
+		goto put_cmd;
=20
 	init_waitqueue_head(&tmr->tmr_wait);
=20
@@ -616,7 +614,7 @@ static void scsiback_device_action(struct vscsibk_pend =
*pending_req,
 			       unpacked_lun, tmr, act, GFP_KERNEL,
 			       tag, TARGET_SCF_ACK_KREF);
 	if (rc)
-		goto err;
+		goto free_tmr;
=20
 	wait_event(tmr->tmr_wait, atomic_read(&tmr->tmr_complete));
=20
@@ -626,7 +624,9 @@ static void scsiback_device_action(struct vscsibk_pend =
*pending_req,
 	scsiback_do_resp_with_sense(NULL, err, 0, pending_req);
 	transport_generic_free_cmd(&pending_req->se_cmd, 1);
 	return;
-err:
+put_cmd:
+	target_put_sess_cmd(se_cmd);
+free_tmr:
 	kfree(tmr);
 	scsiback_do_resp_with_sense(NULL, err, 0, pending_req);
 }
--=20
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
