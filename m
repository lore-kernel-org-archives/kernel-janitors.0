From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Fri, 24 Sep 2004 21:00:47 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm2] Create new function to
Message-Id: <1096059645.10797.1.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92976370928138208=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <2480000.1095978400@w-hlinder.beaverton.ibm.com>
	 <20040924200231.A30391@infradead.org>  <20040924211912.GC7619@kroah.com>
In-Reply-To: <20040924211912.GC7619@kroah.com>
To: Greg KH <greg@kroah.com>
Cc: Christoph Hellwig <hch@infradead.org>, Hanna Linder <hannal@us.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org, davej@codemonkey.org.uk, hpa@zytor.com

--===============92976370928138208==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Gwe, 2004-09-24 at 22:19, Greg KH wrote:
> > Please include subdevice/subvendor id
> 
> Good idea, but do you see any places in the kernel that would use those
> fields, instead of always setting them to PCI_ANY_ID?

If you are taking that path then make it take a pci_device_id table.
That makes it behave like other interfaces of the same form, and makes
the implementation remarkably trivial.


--===============92976370928138208==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92976370928138208==--
