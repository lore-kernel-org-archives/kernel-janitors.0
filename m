From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 20 Oct 2004 22:06:57 +0000
Subject: Re: [KJ] [RFT 2.6] intel-mch-agp.c: replace pci_find_device with
Message-Id: <20041020220657.GB26465@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93296078320011167=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <17860000.1098298381@w-hlinder.beaverton.ibm.com> <20041020220413.GA16153@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20041020220413.GA16153@parcelfarce.linux.theplanet.co.uk>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Hanna Linder <hannal@us.ibm.com>, davej@codemonkey.org.uk, kernel-janitors <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>, greg@kroah.com

--===============93296078320011167==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2004 at 11:04:13PM +0100, Matthew Wilcox wrote:
> On Wed, Oct 20, 2004 at 11:53:01AM -0700, Hanna Linder wrote:
> > 
> > As pci_find_device is going away soon I have converted this file to use
> > pci_get_device instead. I have compile tested it. If anyone has this hardware
> > and could test it that would be great.
> 
> Also a pci_driver candidate.

Same issue as above


--===============93296078320011167==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93296078320011167==--
