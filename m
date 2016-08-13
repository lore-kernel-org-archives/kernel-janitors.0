From: Joe Perches <joe@perches.com>
Date: Sat, 13 Aug 2016 16:41:38 +0000
Subject: Re: [PATCH 2/2 v3] be2iscsi: Fix some error messages
Message-Id: <1471106498.3467.19.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4cd24bc3-7953-479a-1dbe-2aac9299ce13@wanadoo.fr>
	 <1471072824-1491-1-git-send-email-christophe.jaillet@wanadoo.fr>
	 <1471088144.3467.11.camel@perches.com>
	 <fdffed8e-d269-6519-437e-6f731dbb9c05@wanadoo.fr>
In-Reply-To: <fdffed8e-d269-6519-437e-6f731dbb9c05@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jayamohan.kallickal@avagotech.com, jejb@linux.vnet.ibm.com, ketan.mukadam@avagotech.com, sony.john@avagotech.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2016-08-13 at 14:31 +0200, Christophe JAILLET wrote:
> Le 13/08/2016 =E0 13:35, Joe Perches a =E9crit :
> > > @@ -268,7 +268,7 @@ static int beiscsi_eh_abort(struct scsi_cmnd *sc)
> > > =A0=A0				&nonemb_cmd.dma);
> > > =A0=A0	if (nonemb_cmd.va =3D NULL) {
> > > =A0=A0		beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_EH,
> > > -			=A0=A0=A0=A0"BM_%d : Failed to allocate memory for"
> > > +			=A0=A0=A0=A0"BM_%d : Failed to allocate memory for "
> > > =A0=A0			=A0=A0=A0=A0"mgmt_invalidate_icds\n");
> > doesn't match commit log as no coalescing/concatenation
> > is done.
> >=20
> > There are many of these.
> >=20
> I have *only* fixed the one reported by checkpatch and left the others=A0
> unchanged.
>=20
> My initial proposal was to fix incorrect strings, without modifying too=A0
> much the code. So I decided to do the minimum of changes.
>=20
> Should I resubmitted with:
> =A0=A0=A0=A0- all strings *in the patch* concatenated?
> =A0=A0=A0=A0- all strings *in the file*" concatenated?

Hello Christophe

You don't _have_ to do anything.

I think the commit message is misleading.

You could submit another patch that does
the equivalent of:

$ ./scripts/checkpatch.pl --types=3DSPLIT_STRING --fix-inplace drivers/scsi=
/be2iscsi/be_main.c

with the appropriate commit message

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
