From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 15 Feb 2005 14:46:11 +0000
Subject: Re: [KJ] [PATCH][RESUBMIT][11/21] drivers/scsi/* - compile warning
Message-Id: <20050215144611.GA23200@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80219004331485511=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42113C2D.5008.52BF1B@localhost>
	<20050215103959.GB19930@infradead.org>
	<20050215140902.GM29917@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050215140902.GM29917@parcelfarce.linux.theplanet.co.uk>
To: Matthew Wilcox <matthew@wil.cx>
Cc: kernel-janitors@lists.osdl.org, linux-scsi@vger.kernel.org

--===============80219004331485511==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 15, 2005 at 02:09:02PM +0000, Matthew Wilcox wrote:
> On Tue, Feb 15, 2005 at 10:39:59AM +0000, Christoph Hellwig wrote:
> > > -	return readb(host->base + (reg^bE));
> > > +	return readb((volatile void __iomem *)(host->base + (reg^bE)));
> > 
> > Again, no.  Stop casting to void __iomem pointers, please don't submit
> > a patch like this one again ever.
> 
> Actually, for 53c700, I think this *is* the right fix.  Unless we want to
> move it away from using host->base (which is marked as "legacy crap", so
> maybe we do).  I guess pushing it into hostdata is the preferred way?

Yes.


--===============80219004331485511==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80219004331485511==--
