From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Jan 2018 11:39:12 +0000
Subject: Re: [PATCH 1/1] tools: fix cross-compile var export
Message-Id: <20180108113912.3eqyooxlpuqwr4zc@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171223210641.24588-1-martin@martingkelly.com>
 <20171223210641.24588-2-martin@martingkelly.com>
 <2512a330-1d30-d977-c635-233492da903a@martingkelly.com>
 <011d91f4-5410-eac4-ebbb-7777fbd6519a@martingkelly.com>
In-Reply-To: <011d91f4-5410-eac4-ebbb-7777fbd6519a@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Martin Kelly <martin@martingkelly.com>
Cc: kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, linux-kbuild@vger.kernel.org

On Sat, Jan 06, 2018 at 12:17:40PM -0800, Martin Kelly wrote:
> On 12/23/2017 02:16 PM, Martin Kelly wrote:
> > On 12/23/2017 01:06 PM, Martin Kelly wrote:
> > > From: Martin Kelly <martin@martingkelly.com>
> > >=20
> > > Currently in a number of Makefiles, we clobber the CC, LD, and/or
> > > STRIP env vars
> > > when cross-compiling, which breaks any additional flags that might
> > > be set (such
> > > as sysroot). This easily shows up by using, for instance, a Yocto SDK.
> > >=20
> > > Fix this by more carefully overriding the flags in the way that the p=
erf
> > > Makefile does.
> > >=20
> > > This patch does not fix cross-compile for all the tools (some have
> > > other bugs),
> > > but it does appear to fix it for these:
> > >=20
> > > - cgroup
> > > - freefall
> > > - gpio
> > > - hv
> > > - iio
> > > - leds
> > > - spi
> > > - vm
> > > - wmi
> > >=20
> > > Signed-off-by: Martin Kelly <martin@martingkelly.com>
> > > ---
> > > =A0 tools/cgroup/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 -
> > > =A0 tools/gpio/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 2=
 --
> > > =A0 tools/hv/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 1 -
> > > =A0 tools/iio/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 2 --
> > > =A0 tools/laptop/freefall/Makefile=A0=A0 |=A0 1 -
> > > =A0 tools/leds/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1=
 -
> > > =A0 tools/perf/Makefile.perf=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 6 ------
> > > =A0 tools/power/acpi/Makefile.config |=A0 3 ---
> > > =A0 tools/scripts/Makefile.include=A0=A0 | 18 ++++++++++++++++++
> > > =A0 tools/spi/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 2 --
> > > =A0 tools/usb/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 1 -
> > > =A0 tools/vm/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 1 -
> > > =A0 tools/wmi/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 1 -
> > > =A0 13 files changed, 18 insertions(+), 22 deletions(-)
> > >=20

Hi Martin,

This stuff needs to be broken up into one patch per directory and sent
to the individual maintainers.

Unfortunately, a lot of people haven't filled out MAINTAINERS properly
for their tools/ directory so get_maintainer.pl doesn't always select
the correct mailing list.  Keeping track of the tools/ director is
actually a good task for kernel-janitors btw.

diff --git a/MAINTAINERS b/MAINTAINERS
index 042400542c55..14d93b30aeeb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3625,6 +3625,7 @@ S:        Maintained
 F:     Documentation/cgroup*
 F:     include/linux/cgroup*
 F:     kernel/cgroup*
+F:     tools/cgroup/
=20
 CONTROL GROUP - CPUSET
 M:     Li Zefan <lizefan@huawei.com>

So you might need to manually check MAINTAINERS to find the correct
list.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
