From: Dave Jones <davej@redhat.com>
Date: Wed, 20 Oct 2004 22:07:55 +0000
Subject: Re: [KJ] [RFT 2.6] generic.c: replace pci_find_device with
Message-Id: <20041020220755.GA12553@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52846204843806555=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <17100000.1098298277@w-hlinder.beaverton.ibm.com> <20041020220242.GY16153@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20041020220242.GY16153@parcelfarce.linux.theplanet.co.uk>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Hanna Linder <hannal@us.ibm.com>, lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com

--===============52846204843806555==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2004 at 11:02:42PM +0100, Matthew Wilcox wrote:
 > On Wed, Oct 20, 2004 at 11:51:17AM -0700, Hanna Linder wrote:
 > > As pci_find_device is going away soon I have converted this file to use
 > > pci_get_device instead. I have compile tested it. If anyone has this hardware
 > > and could test it that would be great.
 > 
 > Looks to me like this is a broken interface.  We almost certainly want to
 > pass the agp_device to agp_collect_device_status and agp_device_command,
 > as noted in the comment to agp_collect_device_status.  DaveJ?

It ain't pretty, but I probably won't find time to clean that up
any time soon.  This doesn't impact Hanna's patch however.

		Dave


--===============52846204843806555==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52846204843806555==--
