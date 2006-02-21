From: Stephan Peijnik <sp@sp.or.at>
Date: Tue, 21 Feb 2006 20:12:28 +0000
Subject: Re: [KJ] gcc4 warnings, variable used uninitialized
Message-Id: <1140552748.2600.22.camel@omega.sp.or.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87400682493939641=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140524267.2600.9.camel@omega.sp.or.at>
In-Reply-To: <1140524267.2600.9.camel@omega.sp.or.at>
To: kernel-janitors@vger.kernel.org

--===============87400682493939641==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-02-21 at 13:42 +0100, Arnd Bergmann wrote:
> It has been found that gcc-4.0 gets it wrong. Most of the
> places where gcc-4.0 wrongly complains and gcc-3.4 does not
> have been fixed in gcc-4.1.

Okay, I was about to go and use good old 3.4 for testing purposes.
I've been wondering about the warnings anyways.

> A small number of these bugs are valid and should be fixed, but
> it is not trivial to determine in some cases. What you say about
> this happening with pci_read_config_dword sounds like it is a gcc
> bug and not a bug in the kernel sources, so it should not be fixed
> in the kernel.

I wasn't that sure whether those warnings would be right and kept
forever or not. Doing those minimalistic modifications probably wouldn't
have done any harm, but you are right about where the problem(s) should
be fixed.

> 
> Can you be more specific with the example and/or reproduce
> it with gcc-4.1?

I'm compiling a fresh copy of 4.1 right now, but a good example would be
drivers/char/agp/generic.c's get_agp_version function. It defines a 'u32
ncapid'. A pointer to that u32 is then given to pci_read_config_dword
and at exactly that point gcc-4.0 starts complaining. See below.

<snip>
void get_agp_version(struct agp_bridge_data *bridge)
{
	u32 ncapid;

	/* Exit early if already set by errata workarounds. */
	if (bridge->major_version != 0)
		return;

	pci_read_config_dword(bridge->dev, bridge->capndx, &ncapid);
[...]
</snip>

However, thanks for the response. On that topic everything is kind of
clear to me now.


Regards,

Stephan Peijnik


--===============87400682493939641==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87400682493939641==--
