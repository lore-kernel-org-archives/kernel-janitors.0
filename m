From: Dave Jones <davej@redhat.com>
Date: Wed, 20 Oct 2004 22:10:16 +0000
Subject: Re: [KJ] [RFT 2.6] intel-agp.c: replace pci_find_device with
Message-Id: <20041020221016.GB12553@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32490857058990064=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <17420000.1098298334@w-hlinder.beaverton.ibm.com> <20041020220347.GZ16153@parcelfarce.linux.theplanet.co.uk> <20041020220638.GA26465@infradead.org>
In-Reply-To: <20041020220638.GA26465@infradead.org>
To: Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <matthew@wil.cx>, Hanna Linder <hannal@us.ibm.com>, davej@codemonkey.org.uk, kernel-janitors <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>, greg@kroah.com

--===============32490857058990064==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2004 at 11:06:38PM +0100, Christoph Hellwig wrote:

 > > > As pci_find_device is going away soon I have converted this file to use
 > > > pci_get_device instead. I have compile tested it. If anyone has this hardware
 > > > and could test it that would be great.
 > > 
 > > Should be converted to the pci_driver API.
 > 
 > No.  It's already using the pci_driver API, but the same device can be
 > handled differently depending on the presence of another one.  Maybe
 > pci_dev_present would fit here.

Maybe, but if this kind of cleanup work is done on this code,
I want it sat in -mm for quite a while. This code has been
quite fragile in the past, and I've lost count how many
times we've broken some Intel i8xx variant inadvertantly.

The fragility is a good indicator however to just how crap
that code actually is, and was one of my motivations for
moving the EM64T stuff to the -mch driver.

		Dave


--===============32490857058990064==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32490857058990064==--
