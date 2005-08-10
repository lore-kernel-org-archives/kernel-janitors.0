From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 10 Aug 2005 10:12:44 +0000
Subject: Re: [KJ] excessive permissions
Message-Id: <20050810101244.GB12864@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42351560876802274=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <32819.158.102.162.5.1123580649.squirrel@picard.linux.it>
In-Reply-To: <32819.158.102.162.5.1123580649.squirrel@picard.linux.it>
To: kernel-janitors@vger.kernel.org

--===============42351560876802274==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 09, 2005 at 11:44:09AM +0200, Carlo Perassi wrote:
> linux-2.6.13-rc6/drivers/net/amd8111e.c
> linux-2.6.13-rc6/drivers/net/amd8111e.h

Yep.

> linux-2.6.13-rc6/drivers/mtd/nand/sharpsl.c

git web interface says it's 644.

> are set to 755.

FWIW,

scrtips/checkstack.pl
scripts/gcc-version.sh
scripts/gen_initramfs_list.sh
scripts/mkmakefile
scripts/mksysmap
scripts/namespace.pl
scripts/reference_discarded.pl
scripts/reference_init.pl
scripts/show_delta

are 644.


--===============42351560876802274==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42351560876802274==--
