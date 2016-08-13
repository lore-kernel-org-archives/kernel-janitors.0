From: Joe Perches <joe@perches.com>
Date: Sat, 13 Aug 2016 11:35:44 +0000
Subject: Re: [PATCH 2/2 v3] be2iscsi: Fix some error messages
Message-Id: <1471088144.3467.11.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4cd24bc3-7953-479a-1dbe-2aac9299ce13@wanadoo.fr>
	 <1471072824-1491-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1471072824-1491-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jayamohan.kallickal@avagotech.com, jejb@linux.vnet.ibm.com, ketan.mukadam@avagotech.com, sony.john@avagotech.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2016-08-13 at 09:20 +0200, Christophe JAILLET wrote:
> This fixes:
[]
> =A0=A0=A0- concatenate strings on the same line to fix checkpatch warnings
[]
> diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_m=
ain.c
[]
> @@ -268,7 +268,7 @@ static int beiscsi_eh_abort(struct scsi_cmnd *sc)
> =A0				&nonemb_cmd.dma);
> =A0	if (nonemb_cmd.va =3D NULL) {
> =A0		beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_EH,
> -			=A0=A0=A0=A0"BM_%d : Failed to allocate memory for"
> +			=A0=A0=A0=A0"BM_%d : Failed to allocate memory for "
> =A0			=A0=A0=A0=A0"mgmt_invalidate_icds\n");

doesn't match commit log as no coalescing/concatenation
is done.

There are many of these.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
