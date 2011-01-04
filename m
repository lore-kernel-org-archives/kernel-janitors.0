From: James Bottomley <James.Bottomley@suse.de>
Date: Tue, 04 Jan 2011 19:58:41 +0000
Subject: RE: [patch] [SCSI] scsi_dh: potential null dereference in
Message-Id: <1294171121.7879.6.camel@mulgrave.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110103054833.GT1886@bicker>
	 <E463DF2B2E584B4A82673F53D62C2EF4F5582F42@cosmail01.lsi.com>
	 <1294158279.4726.17.camel@mulgrave.site>
	 <E463DF2B2E584B4A82673F53D62C2EF4F5583074@cosmail01.lsi.com>
In-Reply-To: <E463DF2B2E584B4A82673F53D62C2EF4F5583074@cosmail01.lsi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: "Moger, Babu" <Babu.Moger@lsi.com>
Cc: Dan Carpenter <error27@gmail.com>, Mike Snitzer <snitzer@redhat.com>, Menny Hamburger <Menny_Hamburger@Dell.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, 2011-01-04 at 12:50 -0700, Moger, Babu wrote:
> > -----Original Message-----
> > From: James Bottomley [mailto:James.Bottomley@suse.de]
> > Sent: Tuesday, January 04, 2011 10:25 AM
> > To: Moger, Babu
> > Cc: Dan Carpenter; Mike Snitzer; Menny Hamburger; linux-
> > scsi@vger.kernel.org; kernel-janitors@vger.kernel.org
> > Subject: RE: [patch] [SCSI] scsi_dh: potential null dereference in
> > scsi_dh_activate()
> >=20
> > On Tue, 2011-01-04 at 09:13 -0700, Moger, Babu wrote:
> > > Looks good to me.
> >=20
> > It does?  The first check is the bogus one, surely.  The queue is
> > created and destroyed by scsi_alloc_sdev(), so queuedata can never be
> > NULL for a SCSI queue.  There's no check anywhere in the rest of SCSI,
> > so there shouldn't be one here, should there?
>=20
> You are right. This check may not be required.
>=20
> But I am not sure why there is a check in scsi_device_from_queue.=20
> Is there a possibility of request_fn other than scsi_request_fn for scsi =
device?  I don=E2=80=99t know.  Here is the code..
>=20
> struct scsi_device *scsi_device_from_queue(struct request_queue *q)
> {
>         struct scsi_device *sdev =3D NULL;
>=20
>         if (q->request_fn =3D scsi_request_fn)
>                 sdev =3D q->queuedata;
>=20
>         return sdev;

It can be called for any queue so it returns NULL for a non-SCSI queue.
If you think the queue scsi_dh_activate() is called on may be a non-scsi
one, then you need to use scsi_device_from_queue() and check the result.
Checking q->queuedata for NULL isn't sufficient because other devices
are perfectly entitled to use q->queuedata for their own purposes.  If
you know you have a SCSI queue, you can just pick sdev out of
q->queuedata.

James


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
