From: Scott Feldman <sfeldma@pobox.com>
Date: Sat, 09 Oct 2004 21:35:50 +0000
Subject: Re: [KJ] [RFT 2.6] pci-gart.c replace pci_find_device with
Message-Id: <1097354748.6579.0.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91112067961504994=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <87680000.1097276112@w-hlinder.beaverton.ibm.com>
	 <1097342134.3903.14.camel@sfeldma-mobl2.dsl-verizon.net>
	 <20041009181859.GW16153@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20041009181859.GW16153@parcelfarce.linux.theplanet.co.uk>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Hanna Linder <hannal@us.ibm.com>, kernel-janitors <kernel-janitors@lists.osdl.org>, ak@suse.de, lkml <linux-kernel@vger.kernel.org>, greg@kroah.com

--===============91112067961504994==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2004-10-09 at 11:18, Matthew Wilcox wrote:
> > for_each_pci_dev?
> 
> for_each_pci_dev() doesn't take a VENDOR/DEVICE ID pair.
> I think this is a mistake.

You're right, my bad.

-scott


--===============91112067961504994==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91112067961504994==--
