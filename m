From: =?koi8-r?Q?=22?=Alexey Dobriyan=?koi8-r?Q?=22=20?=<adobriyan@mail.ru>
Date: Wed, 16 Jun 2004 14:58:56 +0000
Subject: Re: [Kernel-janitors] Sparse checks #9
Message-Id: <E1BabsO-00051C-00.adobriyan-mail-ru@f12.mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85714898342496393=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1087343099.676.115.camel@boxen>
In-Reply-To: <1087343099.676.115.camel@boxen>
To: kernel-janitors@vger.kernel.org

--===============85714898342496393==
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit

> --- 1.2/drivers/char/lcd.c      2003-09-01 01:14:08 +02:00
> +++ edited/drivers/char/lcd.c   2004-06-16 00:27:01 +02:00
> @@ -63,7 +63,8 @@
>         struct lcd_display button_display;
>         unsigned long address, a;
>         int index;
> -
> +       struct lcd_display __user *ubuf = (struct lcd_display __user) arg;

It should be

struct lcd_display __user *ubuf = (struct lcd_display __user *) arg;

Alexey

--===============85714898342496393==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85714898342496393==--
