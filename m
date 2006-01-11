From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 11 Jan 2006 15:55:10 +0000
Subject: Re: [KJ] [Patch] Check unsigned < 0 in /drivers/net/acenic.c
Message-Id: <20060111155506.GA8686@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80498024517956068=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134691549.14588.3.camel@alice>
In-Reply-To: <1134691549.14588.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============80498024517956068==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2006 at 03:25:21PM +0100, Eric Sesterhenn / snakebyte wrote:
> On Mon, 2006-01-09 at 00:15 +0300, Alexey Dobriyan wrote:
> > Looks like there are two different tmps: one for read_eeprom_byte,
> > another for writing to PCI state.
>
> guess, this patch is better then. but maybe you can suggest
> a better variable name then tmp2... :)

Argh... Sorry for not being clear enough. "tmp" is a good name as soon
as you put it in those mac reading loops. I fixed it locally.

--- linux-kj.orig/drivers/net/acenic.c
+++ linux-kj/drivers/net/acenic.c
@@ -1002,6 +1002,8 @@ static int __devinit ace_init(struct net
 
 	mac1 = 0;
 	for(i = 0; i < 4; i++) {
+		int tmp;
+
 		mac1 = mac1 << 8;
 		tmp = read_eeprom_byte(dev, 0x8c+i);
 		if (tmp < 0) {
@@ -1012,6 +1014,8 @@ static int __devinit ace_init(struct net
 	}
 	mac2 = 0;
 	for(i = 4; i < 8; i++) {
+		int tmp;
+
 		mac2 = mac2 << 8;
 		tmp = read_eeprom_byte(dev, 0x8c+i);
 		if (tmp < 0) {

> --- linux-2.6.15/drivers/net/acenic.c.orig
> +++ linux-2.6.15/drivers/net/acenic.c	2006-01-09 15:23:55.000000000 +0100
> @@ -906,7 +906,7 @@ static int __devinit ace_init(struct net
>  	unsigned long myjif;
>  	u64 tmp_ptr;
>  	u32 tig_ver, mac1, mac2, tmp, pci_state;
> -	int board_idx, ecode = 0;
> +	int board_idx, tmp2, ecode = 0;
>  	short i;
>  	unsigned char cache_size;


--===============80498024517956068==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80498024517956068==--
