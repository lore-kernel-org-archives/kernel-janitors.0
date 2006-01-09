From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 09 Jan 2006 14:25:21 +0000
Subject: Re: [KJ] [Patch] Check unsigned < 0 in /drivers/net/acenic.c
Message-Id: <1136816722.14848.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46344138460024631=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134691549.14588.3.camel@alice>
In-Reply-To: <1134691549.14588.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============46344138460024631==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2006-01-09 at 00:15 +0300, Alexey Dobriyan wrote:
> Looks like there are two different tmps: one for read_eeprom_byte,
> another for writing to PCI state.

guess, this patch is better then. but maybe you can suggest
a better variable name then tmp2... :)

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15/drivers/net/acenic.c.orig	2006-01-09 15:22:53.000000000 +0100
+++ linux-2.6.15/drivers/net/acenic.c	2006-01-09 15:23:55.000000000 +0100
@@ -906,7 +906,7 @@ static int __devinit ace_init(struct net
 	unsigned long myjif;
 	u64 tmp_ptr;
 	u32 tig_ver, mac1, mac2, tmp, pci_state;
-	int board_idx, ecode = 0;
+	int board_idx, tmp2, ecode = 0;
 	short i;
 	unsigned char cache_size;
 
@@ -1003,22 +1003,22 @@ static int __devinit ace_init(struct net
 	mac1 = 0;
 	for(i = 0; i < 4; i++) {
 		mac1 = mac1 << 8;
-		tmp = read_eeprom_byte(dev, 0x8c+i);
-		if (tmp < 0) {
+		tmp2 = read_eeprom_byte(dev, 0x8c+i);
+		if (tmp2 < 0) {
 			ecode = -EIO;
 			goto init_error;
 		} else
-			mac1 |= (tmp & 0xff);
+			mac1 |= (tmp2 & 0xff);
 	}
 	mac2 = 0;
 	for(i = 4; i < 8; i++) {
 		mac2 = mac2 << 8;
-		tmp = read_eeprom_byte(dev, 0x8c+i);
-		if (tmp < 0) {
+		tmp2 = read_eeprom_byte(dev, 0x8c+i);
+		if (tmp2 < 0) {
 			ecode = -EIO;
 			goto init_error;
 		} else
-			mac2 |= (tmp & 0xff);
+			mac2 |= (tmp2 & 0xff);
 	}
 
 	writel(mac1, &regs->MacAddrHi);



--===============46344138460024631==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46344138460024631==--
