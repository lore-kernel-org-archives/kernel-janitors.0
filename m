From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Sat, 16 Apr 2005 10:36:41 +0000
Subject: Re: [KJ] [patch] net/8139too: use iomap interface
Message-Id: <20050416143501.GA5130@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65396480718250904=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050415205832.GA3880@masina.coderock.org>
In-Reply-To: <20050415205832.GA3880@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============65396480718250904==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 22:58 Fri 15 Apr 2005, Domen Puncer wrote:
> Convert to iomap and add __iomem annotations.

> --- c/drivers/net/8139too.c
> +++ a/drivers/net/8139too.c

In netdev-2.6 tree:
============================================================================
[PATCH] 8139too: use iomap for pio/mmio

Hi,

This patch converts the 8139too driver to use the iomap infrastructure
for PIO and MMIO instead of playing macro tricks.  I also had to fix
read_eeprom(), mdio_sync(), mdio_read(), and mdio_write() to not pass
PIO base address to MMIO read() and write() functions.  In addition,
the patch adds proper __iomem annotations for the driver.

Both modes, PIO and MMIO, were tested with a RealTel RTL8139 card on
an x86 box.  The 8129 support remains untested due to lack of
hardware.

Signed-off-by: Pekka Enberg <penberg@cs.helsinki.fi>
Signed-off-by: Jeff Garzik <jgarzik@pobox.com>

http://gkernel.bkbits.net:8080/netdev-2.6/cset@41de09e3T2bRtDC4_Wp9d1mKtq8xbw?nav=index.html|src/|src/drivers|src/drivers/net|related/drivers/net/8139too.c
============================================================================
I noticed this too late also.


--===============65396480718250904==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65396480718250904==--
