From: James Bottomley <James.Bottomley@SteelEye.com>
Date: Tue, 15 Feb 2005 15:32:06 +0000
Subject: Re: [KJ] [PATCH][RESUBMIT][11/21] drivers/scsi/* - compile warning
Message-Id: <1108481526.5539.17.camel@mulgrave>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36121929968668387=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42113C2D.5008.52BF1B@localhost>
	 <20050215103959.GB19930@infradead.org>
	 <20050215140902.GM29917@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050215140902.GM29917@parcelfarce.linux.theplanet.co.uk>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Christoph Hellwig <hch@infradead.org>, Stephen Biggs <yrgrknmxpzlk@gawab.com>, kernel-janitors@lists.osdl.org, SCSI Mailing List <linux-scsi@vger.kernel.org>

--===============36121929968668387==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2005-02-15 at 14:09 +0000, Matthew Wilcox wrote:
> Actually, for 53c700, I think this *is* the right fix.  Unless we want to
> move it away from using host->base (which is marked as "legacy crap", so
> maybe we do).  I guess pushing it into hostdata is the preferred way?

Well, no it's not really.

If you look at 53c700, what it's actually doing is precisely what the
iomem resources do (i.e. trying to use a cookie or flag to determine if
it's doing mem or io reads/writes).  What needs to happen to this driver
is to convert it to using the new iomem infrastructure and remove its
original implementation.

James



--===============36121929968668387==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36121929968668387==--
