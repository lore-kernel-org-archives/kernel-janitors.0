From: Domen Puncer <domen@coderock.org>
Date: Sat, 26 Jun 2004 13:53:50 +0000
Subject: [Kernel-janitors] add kfree(ha) to drivers/scsi/ips.c
Message-Id: <20040626135349.GA1706@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65242373086581074=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65242373086581074==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

This has been on TODO as long as i remember, lets try to fix it.
Compile tested.


ips_init_phase1 and ips_init_phase2 call ips_abort_init on failure, but
it doesn't free 'ha'.
'ha' should be released on ips_release.

Needs review from someone who knows stuff a bit more.


Signed-off-by: Domen Puncer <domen@coderock.org>


--- c/drivers/scsi/ips.c	2004-06-16 07:18:38.000000000 +0200
+++ a/drivers/scsi/ips.c	2004-06-26 15:36:14.000000000 +0200
@@ -729,6 +729,7 @@ ips_release(struct Scsi_Host *sh)
 	/* free IRQ */
 	free_irq(ha->irq, ha);
 
+	kfree(ha);
 	IPS_REMOVE_HOST(sh);
 	scsi_host_put(sh);
 
@@ -6946,6 +6947,7 @@ ips_abort_init(ips_ha_t * ha, int index)
 {
 	ha->active = 0;
 	ips_free(ha);
+	kfree(ha);
 	ips_ha[index] = 0;
 	ips_sh[index] = 0;
 	return -1;

--===============65242373086581074==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65242373086581074==--
