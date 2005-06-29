From: Carlo Perassi <carlo@linux.it>
Date: Wed, 29 Jun 2005 17:03:39 +0000
Subject: [KJ] Re: cleanup-drivers_usb_serial_cypress_m8.patch
Message-Id: <20050629170339.GA4170@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60658537716555416=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60658537716555416==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Well, this should be changed to:
> 
> 			tty->termios->c_cflag =
> 					B4800 | CS8 | CREAD | HUPCL | CLOCAL;

It is better.

> IMO, better
> 			priv->diff_status |=
> 				priv->current_status ^ priv->prev_status;

It is better too.

Do you need a new patch?

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--===============60658537716555416==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60658537716555416==--
