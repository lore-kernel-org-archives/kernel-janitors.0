From: Dave Jones <davej@redhat.com>
Date: Tue, 21 Feb 2006 20:20:03 +0000
Subject: Re: [KJ] gcc4 warnings, variable used uninitialized
Message-Id: <20060221202003.GA24159@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9213425515959075=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140524267.2600.9.camel@omega.sp.or.at>
In-Reply-To: <1140524267.2600.9.camel@omega.sp.or.at>
To: kernel-janitors@vger.kernel.org

--===============9213425515959075==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2006 at 09:12:28PM +0100, Stephan Peijnik wrote:

 > I'm compiling a fresh copy of 4.1 right now, but a good example would be
 > drivers/char/agp/generic.c's get_agp_version function. It defines a 'u32
 > ncapid'. A pointer to that u32 is then given to pci_read_config_dword
 > and at exactly that point gcc-4.0 starts complaining. See below.
 > 
 > <snip>
 > void get_agp_version(struct agp_bridge_data *bridge)
 > {
 > 	u32 ncapid;
 > 
 > 	/* Exit early if already set by errata workarounds. */
 > 	if (bridge->major_version != 0)
 > 		return;
 > 
 > 	pci_read_config_dword(bridge->dev, bridge->capndx, &ncapid);
 > [...]
 > </snip>

gcc bug.  It doesn't seem to understand that sometimes ptrs to vars get
passed to functions that instantiate them.

There are dozens and dozens of such instances in the kernel tree.
99% of the time that warning is completely bogus.

		Dave


--===============9213425515959075==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9213425515959075==--
