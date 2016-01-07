From: Joe Perches <joe@perches.com>
Date: Thu, 07 Jan 2016 09:59:53 +0000
Subject: Re: [patch] MAINTAINERS: fix MIC maintainers entry
Message-Id: <1452160793.4028.13.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160107094001.GE27186@mwanda> <20160107094345.GB5177@mwanda>
In-Reply-To: <20160107094345.GB5177@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Sudeep Dutt <sudeep.dutt@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Thu, 2016-01-07 at 12:43 +0300, Dan Carpenter wrote:
> I wrote some bash to find problems in MAINTAINERS.=A0=A0I'm not sure what=
 to
> do with it.
>=20
> # Grep for missing colons
> for i in $(cut -b 1-2 MAINTAINERS | grep : | sort | uniq | cut -b 1) ; do
> =A0=A0=A0=A0egrep "^$i[=A0	]" MAINTAINERS
> done
>=20
> # Grep for non-existing files
> for i in $(grep ^F: MAINTAINERS | grep -v '\*' | cut -d : -f 2-) ; do
> =A0=A0=A0=A0if ! test -e $i ; then
> =A0=A0=A0=A0=A0=A0=A0=A0echo $i
> =A0=A0=A0=A0fi
> done

I run a similar script every once in awhile.

Here's my current list with -next:

$ verify_maintainer_patterns.pl
0	drivers/infiniband/hw/amso1100/
0	arch/arm/mach-pxa/include/mach/palmt5.h
0	arch/arm/mach-pxa/include/mach/palmte2.h
0	arch/arm/mach-pxa/include/mach/palmtreo.h
0	arch/arm/mach-pxa/include/mach/palmz72.h
0	arch/arm/plat-samsung/s5p-dev-mfc.c
0	include/media/atmel-isi.h
0	arch/mips/bcm3384/*
0	arch/mips/include/asm/mach-bcm3384/*
0	Documentation/cgroups/cpusets.txt
0	drivers/media/i2c/cs3308.h
0	include/media/cx2341x*
0	include/uapi/scsi/cxlflash_ioctls.h
0	Documentation/devicetree/bindings/drm/atmel/
0	Documentation/devicetree/bindings/display/panel/nec,nl4827hc19_05b.txt
0	include/drm/gma500*
0	drivers/infiniband/hw/ehca/
0	drivers/crypto/nx/nx_debugfs.h
0	Documentation/devicetree/bindings/i2c/ina209.txt
0	Documentation/s390/kvm.txt
0	drivers/scsi/mpt2sas/
0	drivers/hwmon/max20751.c
0	Documentation/devicetree/bindings/i2c/max6697.txt
0	include/media/saa7146*
0	drivers/staging/ft1000/
0	fs/hppfs/


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
