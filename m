From: "Daniel E. Wilson" <danw@bureau-13.org>
Date: Mon, 28 Mar 2005 03:29:33 +0000
Subject: [KJ] Elimiation of isa_read* functions.
Message-Id: <42477A1D.7040803@bureau-13.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010009090205020204060707"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010009090205020204060707
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

This is my first attempt at cleaning up something so I decided to try
something really simple.

The lance.c file is using the depreciated isa_readw and isa_readl functions.

Dan

--------------010009090205020204060707
Content-Type: text/plain;
 name="remap.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="remap.patch"

diff -Nrc a/drivers/net/lance.c b/drivers/net/lance.c
*** a/drivers/net/lance.c	2005-03-27 19:14:39 -08:00
--- b/drivers/net/lance.c	2005-03-27 19:14:39 -08:00
***************
*** 472,491 ****
  	static int did_version;			/* Already printed version info. */
  	unsigned long flags;
  	int err = -ENOMEM;
  
  	/* First we look for special cases.
  	   Check for HP's on-board ethernet by looking for 'HP' in the BIOS.
  	   There are two HP versions, check the BIOS for the configuration port.
  	   This method provided by L. Julliard, Laurent_Julliard@grenoble.hp.com.
  	   */
! 	if (isa_readw(0x000f0102) == 0x5048)  {
  		static const short ioaddr_table[] = { 0x300, 0x320, 0x340, 0x360};
! 		int hp_port = (isa_readl(0x000f00f1) & 1)  ? 0x499 : 0x99;
  		/* We can have boards other than the built-in!  Verify this is on-board. */
  		if ((inb(hp_port) & 0xc0) == 0x80
  			&& ioaddr_table[inb(hp_port) & 3] == ioaddr)
  			hp_builtin = hp_port;
  	}
  	/* We also recognize the HP Vectra on-board here, but check below. */
  	hpJ2405A = (inb(ioaddr) == 0x08 && inb(ioaddr+1) == 0x00
  				&& inb(ioaddr+2) == 0x09);
--- 472,495 ----
  	static int did_version;			/* Already printed version info. */
  	unsigned long flags;
  	int err = -ENOMEM;
+ 	char *base_addr;	                /* Base address in the BIOS. */
  
  	/* First we look for special cases.
  	   Check for HP's on-board ethernet by looking for 'HP' in the BIOS.
  	   There are two HP versions, check the BIOS for the configuration port.
  	   This method provided by L. Julliard, Laurent_Julliard@grenoble.hp.com.
  	   */
! 	base_addr = ioremap(0x000f0000, 0x104);
! 	if (readw(base_addr + 0x102) == 0x5048)  {
  		static const short ioaddr_table[] = { 0x300, 0x320, 0x340, 0x360};
! 		int hp_port = (readl(base_addr + 0xf1) & 1)  ? 0x499 : 0x99;
  		/* We can have boards other than the built-in!  Verify this is on-board. */
  		if ((inb(hp_port) & 0xc0) == 0x80
  			&& ioaddr_table[inb(hp_port) & 3] == ioaddr)
  			hp_builtin = hp_port;
  	}
+ 	iounmap(base_addr);
+ 
  	/* We also recognize the HP Vectra on-board here, but check below. */
  	hpJ2405A = (inb(ioaddr) == 0x08 && inb(ioaddr+1) == 0x00
  				&& inb(ioaddr+2) == 0x09);

--------------010009090205020204060707
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010009090205020204060707--
