From: Gerd Knorr <kraxel@bytesex.org>
Date: Thu, 30 Sep 2004 08:23:05 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 bttv-driver.c][4/8]
Message-Id: <20040930082305.GB20456@bytesex>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============073943568962396178=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <15470000.1096491322@w-hlinder.beaverton.ibm.com> <20040929220344.A17872@infradead.org> <20040929222353.GF21770@thundrix.ch>
In-Reply-To: <20040929222353.GF21770@thundrix.ch>
To: Tonnerre <tonnerre@thundrix.ch>
Cc: Christoph Hellwig <hch@infradead.org>, Hanna Linder <hannal@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, greg@kroah.com

--===============073943568962396178==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2004 at 12:23:53AM +0200, Tonnerre wrote:
> Salut,
> 
> On Wed, Sep 29, 2004 at 10:03:44PM +0100, Christoph Hellwig wrote:
> > I think this check should just go away completely.  
> > We don't have such silly warnings in any other driver.
> 
> Kraxel introduced this  check because of the confusion  with the "old"
> and "new" WinTV cards. The older one had a bt848 chip, the newer one a
> connexant 878, and only the older one was supported by Linux.

Yep, that was the reason.  It's pretty much obsolete these days through
as we have a working (well, sort of, depending on the tv norm sound may
be a problem ...) driver for these cards in mainline.  Just dropping
that now is perfectly fine.

  Gerd

-- 
return -ENOSIG;

--===============073943568962396178==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============073943568962396178==--
