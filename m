From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 29 Sep 2004 22:32:18 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 bttv-driver.c][4/8]
Message-Id: <21370000.1096497138@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64743760303656273=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <15470000.1096491322@w-hlinder.beaverton.ibm.com> <20040929220344.A17872@infradead.org> <20040929211135.GA24407@kroah.com> <17920000.1096494218@w-hlinder.beaverton.ibm.com>
 <20040929222825.GK16153@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20040929222825.GK16153@parcelfarce.linux.theplanet.co.uk>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Hanna Linder <hannal@us.ibm.com>, Greg KH <greg@kroah.com>, Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, kraxel@bytesex.org

--===============64743760303656273==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Wednesday, September 29, 2004 11:28:25 PM +0100 Matthew Wilcox <matthew@wil.cx> wrote:

> On Wed, Sep 29, 2004 at 02:43:38PM -0700, Hanna Linder wrote:
>> +	return(pci_module_init(&bttv_pci_driver));
> 
> Why the extra brackets?  I see their use for

I was already corrected offline. Greg is going to fix this before he applies it.

Thanks.

Hanna


--===============64743760303656273==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64743760303656273==--
