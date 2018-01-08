From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Jan 2018 19:23:44 +0000
Subject: Re: [PATCH 1/1] tools: fix cross-compile var export
Message-Id: <20180108192343.ws5miawbslafclzw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171223210641.24588-1-martin@martingkelly.com>
 <20171223210641.24588-2-martin@martingkelly.com>
 <2512a330-1d30-d977-c635-233492da903a@martingkelly.com>
 <011d91f4-5410-eac4-ebbb-7777fbd6519a@martingkelly.com>
 <20180108113912.3eqyooxlpuqwr4zc@mwanda>
 <287b0a7d-1c4d-0faa-eafb-5d17d0d9063b@martingkelly.com>
In-Reply-To: <287b0a7d-1c4d-0faa-eafb-5d17d0d9063b@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Martin Kelly <martin@martingkelly.com>
Cc: kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, linux-kbuild@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

On Mon, Jan 08, 2018 at 09:24:42AM -0800, Martin Kelly wrote:
> On 01/08/2018 03:39 AM, Dan Carpenter wrote:
> > On Sat, Jan 06, 2018 at 12:17:40PM -0800, Martin Kelly wrote:
> > > On 12/23/2017 02:16 PM, Martin Kelly wrote:
> > > > On 12/23/2017 01:06 PM, Martin Kelly wrote:
> > > > > From: Martin Kelly <martin@martingkelly.com>
> > > > >=20
> > > > > Currently in a number of Makefiles, we clobber the CC, LD, and/or
> > > > > STRIP env vars
> > > > > when cross-compiling, which breaks any additional flags that might
> > > > > be set (such
> > > > > as sysroot). This easily shows up by using, for instance, a Yocto=
 SDK.
> > > > >=20
> > > > > Fix this by more carefully overriding the flags in the way that t=
he perf
> > > > > Makefile does.
> > > > >=20
> > > > > This patch does not fix cross-compile for all the tools (some have
> > > > > other bugs),
> > > > > but it does appear to fix it for these:
> > > > >=20
> > > > > - cgroup
> > > > > - freefall
> > > > > - gpio
> > > > > - hv
> > > > > - iio
> > > > > - leds
> > > > > - spi
> > > > > - vm
> > > > > - wmi
> > > > >=20
> > > > > Signed-off-by: Martin Kelly <martin@martingkelly.com>
> > > > > ---
> > > > >  =A0 tools/cgroup/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 =
1 -
> > > > >  =A0 tools/gpio/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 2 --
> > > > >  =A0 tools/hv/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 1 -
> > > > >  =A0 tools/iio/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0 2 --
> > > > >  =A0 tools/laptop/freefall/Makefile=A0=A0 |=A0 1 -
> > > > >  =A0 tools/leds/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 1 -
> > > > >  =A0 tools/perf/Makefile.perf=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 6 ----=
--
> > > > >  =A0 tools/power/acpi/Makefile.config |=A0 3 ---
> > > > >  =A0 tools/scripts/Makefile.include=A0=A0 | 18 ++++++++++++++++++
> > > > >  =A0 tools/spi/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0 2 --
> > > > >  =A0 tools/usb/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0 1 -
> > > > >  =A0 tools/vm/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 1 -
> > > > >  =A0 tools/wmi/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0 1 -
> > > > >  =A0 13 files changed, 18 insertions(+), 22 deletions(-)
> > > > >=20
> >=20
> > Hi Martin,
> >=20
> > This stuff needs to be broken up into one patch per directory and sent
> > to the individual maintainers.
> >=20
> > Unfortunately, a lot of people haven't filled out MAINTAINERS properly
> > for their tools/ directory so get_maintainer.pl doesn't always select
> > the correct mailing list.  Keeping track of the tools/ director is
> > actually a good task for kernel-janitors btw.
> >=20
>=20
> Hi Dan,
>=20
> I'm very confused at this point, as I am hearing different things from
> different people. This patch is a bit unique in that it spans multiple
> subsystems but is a single, logical bugfix (see
> https://marc.info/?l=3Dlinux-kernel&m=151534992512934&w=3D2 for details).=
 This
> means that to follow the one-patch-per-logical change rule, I have to bre=
ak
> the patch-for-subsystem-X-goes-to-maintainer-of-subsystem-X rule, and vice
> versa.
>=20
> Given that this is a single logical change, Paul Gortmaker suggested that=
 I
> CC each maintainer and try to get Andrew Morton to pick it up:
>=20

That's actually a good idea.  Do it that way.

regards,
dan carpenter


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
