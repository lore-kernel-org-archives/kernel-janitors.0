From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 06:27:18 +0000
Subject: [KJ] [PATCH 13/18] drivers/telephony/ remove pci_find_{device,
Message-Id: <200502141145.21711.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============02814004593195607=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============02814004593195607==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/drivers/telephony/ixj.c linux-2.6.11-rc3/drivers/telephony/ixj.c
--- orig/drivers/telephony/ixj.c	2005-02-11 15:19:54.000000000 +0530
+++ linux-2.6.11-rc3/drivers/telephony/ixj.c	2005-02-14 05:32:27.000000000 +0530
@@ -7751,7 +7751,7 @@ static int __init ixj_probe_pci(int *cnt
 	IXJ *j = NULL;
 
 	for (i = 0; i < IXJMAX - *cnt; i++) {
-		pci = pci_find_device(0x15E2, 0x0500, pci);
+		pci = pci_get_device(0x15E2, 0x0500, pci);
 		if (!pci)
 			break;
 


--===============02814004593195607==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============02814004593195607==--
