From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 31 Oct 2004 14:45:10 +0000
Subject: [KJ] [patch 5/6] sata_promise remove duplicate msleep() definition
Message-Id: <20041031144510.GF28667@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36250476919667118=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040923221303.GB13244@us.ibm.com> <20040923221303.GB13244@us.ibm.com> <5.1.0.14.2.20040924074745.00b1cd40@pop.t-online.de> <415CD9D9.2000607@pobox.com> <20041030222228.GB1456@stro.at> <41841886.2080609@pobox.com>
In-Reply-To: <41841886.2080609@pobox.com>
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Margit Schubert-While <margitsw@t-online.de>, Nishanth Aravamudan <nacc@us.ibm.com>, hvr@gnu.org, mcgrof@studorgs.rutgers.edu, kernel-janitors@lists.osdl.org, netdev@oss.sgi.com, Domen Puncer <domen@coderock.org>, linux-kernel@vger.kernel.org

--===============36250476919667118==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

remove now duplicate define.
driver already includes delay.

Signed-off-by: Maximilian Attems <janitor@sternwelten.at>


---

 linux-2.4.28-rc1-max/drivers/scsi/sata_promise.c |    2 --
 1 files changed, 2 deletions(-)

diff -puN drivers/scsi/sata_promise.c~remove-msleep-drivers_scsi_sata_promise drivers/scsi/sata_promise.c
--- linux-2.4.28-rc1/drivers/scsi/sata_promise.c~remove-msleep-drivers_scsi_sata_promise	2004-10-31 13:59:39.000000000 +0100
+++ linux-2.4.28-rc1-max/drivers/scsi/sata_promise.c	2004-10-31 14:00:12.000000000 +0100
@@ -42,8 +42,6 @@
 #define DRV_NAME	"sata_promise"
 #define DRV_VERSION	"1.00"
 
-#define msleep libata_msleep	/* 2.4-specific */
-
 enum {
 	PDC_PKT_SUBMIT		= 0x40, /* Command packet pointer addr */
 	PDC_INT_SEQMASK		= 0x40,	/* Mask of asserted SEQ INTs */
_

--===============36250476919667118==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36250476919667118==--
