From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 05 Oct 2004 19:34:27 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6] hades-pci.c: replace
Message-Id: <Pine.GSO.4.61.0410052134120.9981@waterleaf.sonytel.be>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54594427084095543=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <280230000.1096924777@w-hlinder.beaverton.ibm.com>
In-Reply-To: <280230000.1096924777@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org, Greg Kroah-Hartman <greg@kroah.com>, Roman Zippel <zippel@linux-m68k.org>

--===============54594427084095543==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 4 Oct 2004, Hanna Linder wrote:
> As pci_find_device is going away I have replaced this call with pci_get_device.
> If anyone has access to a Hades Atari clone to test this one I would appreciate it..

Applied, thanks!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

--===============54594427084095543==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54594427084095543==--
