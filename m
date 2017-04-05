From: Yuval Shaia <yuval.shaia@oracle.com>
Date: Wed, 05 Apr 2017 15:17:48 +0000
Subject: Re: [PATCH 1/5] IB/qib: Use kcalloc() in qib_init_iba7322_funcs()
Message-Id: <20170405151747.GB5519@yuval-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c16b18ac-287f-5faf-b79a-c86e2adfa22c@users.sourceforge.net>
 <5e5e00d3-b6a4-7371-65be-c5fe387d26b3@users.sourceforge.net>
 <20170405143438.GC5006@yuval-lap>
 <fa90e815-daff-57b1-7930-447c6f5fa3ab@users.sourceforge.net>
 <20170405150658.GU3941@linux-x5ow.site>
In-Reply-To: <20170405150658.GU3941@linux-x5ow.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Mike Marciniszyn <infinipath@intel.com>, Sean Hefty <sean.hefty@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Apr 05, 2017 at 05:06:58PM +0200, Johannes Thumshirn wrote:
> On Wed, Apr 05, 2017 at 04:54:40PM +0200, SF Markus Elfring wrote:
> > >> @@ -7324,8 +7324,9 @@ struct qib_devdata *qib_init_iba7322_funcs(str=
uct pci_dev *pdev,
> > >>  		actual_cnt -=3D dd->num_pports;
> > >> =20
> > >>  	tabsize =3D actual_cnt;
> > >> -	dd->cspec->msix_entries =3D kzalloc(tabsize *
> > >> -			sizeof(struct qib_msix_entry), GFP_KERNEL);
> > >> +	dd->cspec->msix_entries =3D kcalloc(tabsize,
> > >> +					  sizeof(*dd->cspec->msix_entries),
> > >> +					  GFP_KERNEL);
> > >=20
> > > Are we fine with loosing the zeroing of the entries?
> >=20
> > How did you get this concern?
> >=20
> > Do you really miss such functionality from the other interface?
>=20
> Ahm... Don't kzalloc() and kcalloc() both pass in __GFP_ZERO?

Yes.
Please ignore my comment.

>=20
> --=20
> Johannes Thumshirn                                          Storage
> jthumshirn@suse.de                                +49 911 74053 689
> SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
> GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
> HRB 21284 (AG N=FCrnberg)
> Key fingerprint =3D EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
