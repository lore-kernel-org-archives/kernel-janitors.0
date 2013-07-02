From: "Saxena, Sumit" <Sumit.Saxena@lsi.com>
Date: Tue, 02 Jul 2013 05:23:23 +0000
Subject: RE: [patch] [SCSI] megaraid_sas: fix a bug for 64 bit arches
Message-Id: <088E451FE1854947BD9145EF8C016FF4139FFCAF11@inbmail01.lsi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130628212104.GA16035@elgon.mountain>
In-Reply-To: <20130628212104.GA16035@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, DL-MegaRAID Linux <megaraidlinux@lsi.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

>-----Original Message-----
>From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
>Sent: Saturday, June 29, 2013 2:51 AM
>To: DL-MegaRAID Linux; Saxena, Sumit
>Cc: James E.J. Bottomley; linux-scsi@vger.kernel.org; kernel-
>janitors@vger.kernel.org
>Subject: [patch] [SCSI] megaraid_sas: fix a bug for 64 bit arches
>
>On 64 bit then -1UL and -1U are not equal, so these conditions don't
>work as intended and it breaks error handling.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>diff --git a/drivers/scsi/megaraid/megaraid_sas_fp.c
>b/drivers/scsi/megaraid/megaraid_sas_fp.c
>index 8056eac..4f401f7 100644
>--- a/drivers/scsi/megaraid/megaraid_sas_fp.c
>+++ b/drivers/scsi/megaraid/megaraid_sas_fp.c
>@@ -585,7 +585,7 @@ u8 get_arm(struct megasas_instance *instance, u32
>ld, u8 span, u64 stripe,
> 	case 1:
> 		/* start with logical arm */
> 		arm = get_arm_from_strip(instance, ld, stripe, map);
>-		if (arm != -1UL)
>+		if (arm != -1U)
> 			arm *= 2;
> 		break;
> 	}
>@@ -637,7 +637,7 @@ static u8 mr_spanset_get_phy_params(struct
>megasas_instance *instance, u32 ld,
>
> 	if (raid->level = 6) {
> 		logArm = get_arm_from_strip(instance, ld, stripRow, map);
>-		if (logArm = -1UL)
>+		if (logArm = -1U)
> 			return FALSE;
> 		rowMod = mega_mod64(row, SPAN_ROW_SIZE(map, ld, span));
> 		armQ = SPAN_ROW_SIZE(map, ld, span) - 1 - rowMod;

Acked-by: Sumit Saxena <sumit.saxena@lsi.com>


Sumit


