From: Bernd Petrovitsch <bernd@firmix.at>
Date: Wed, 22 Feb 2006 00:19:27 +0000
Subject: Re: [KJ] gcc4 warnings, variable used uninitialized
Message-Id: <1140567567.3507.49.camel@gimli.at.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21113897421629169=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140524267.2600.9.camel@omega.sp.or.at>
In-Reply-To: <1140524267.2600.9.camel@omega.sp.or.at>
To: kernel-janitors@vger.kernel.org

--===============21113897421629169==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 2006-02-22 at 00:51 +0100, Håkon Løvdal wrote:
> On 2/21/06, Dave Jones <davej@redhat.com> wrote:
> >  > <snip>
> >  > void get_agp_version(struct agp_bridge_data *bridge)
> >  > {
> >  >      u32 ncapid;
> >  >
> >  >      /* Exit early if already set by errata workarounds. */
> >  >      if (bridge->major_version != 0)
> >  >              return;
> >  >
> >  >      pci_read_config_dword(bridge->dev, bridge->capndx, &ncapid);
> >  > [...]
> >  > </snip>
> >
> > gcc bug.  It doesn't seem to understand that sometimes ptrs to vars get
> > passed to functions that instantiate them.
> >
> > There are dozens and dozens of such instances in the kernel tree.
> > 99% of the time that warning is completely bogus.
> 
> I would not call it a bug. The problem is that gcc does not know if the
> third argument of pci_read_config_dword is used as an in parameter or
> out parameter.

But gcc claims that you use it before actually initializing it (without
actually really knowing it).

Analysis: At most it is possible to declare that parameter as "const
<type> *" which implies that it isn't expected to be written to. This
implies that the parameter is basically read-only (in theory).
And *then* the C compiler can (and should) warn.

If the parameter has no "const" attached as above, the C compiler has no
way (except analyzing the source code) to tell if the parameter, is read
before written too or not.
So the compiler should shut up instead of (possibly) claiming falsely
that the variable is used without initialization.

To go one step further one may say that if the parameter is not "const"
it may be written to (otherwise it should be "const" in these days). But
even this doesn't rule out that it is read before written too (where the
warning makes sense).

To be more contructive: Is it OK to spend the (mostly useless)
initialization code and time (ans shut up the warnings) or not? Or do we
simply wait for a (in this aspect) sane gcc and the problem is solved
anyway.
These are the real questions IMHO.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services




--===============21113897421629169==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21113897421629169==--
