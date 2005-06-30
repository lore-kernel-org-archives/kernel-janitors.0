From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2005 09:18:21 +0000
Subject: [KJ] Re: A new soldier
Message-Id: <Pine.LNX.4.62.0506301117140.11104@numbat.sonytel.be>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============077399138155640257=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbecb304050628072325516b6e@mail.gmail.com> <200506290225.05793.arnd@arndb.de>
In-Reply-To: <200506290225.05793.arnd@arndb.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rodrigo Nascimento <underscore0x5f@gmail.com>, Linux Kernel Development <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org

--===============077399138155640257==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 29 Jun 2005, Arnd Bergmann wrote:
> If you are looking for something bigger with a steep learning curve,
> you could try to do a sample architecture implementation like
> arch/skeleton and include/asm-skeleton, along the lines of the
> original include/asm-generic directory (asm-generic now serves
> as a place to put code that is the same on most archs but is different
> on others).
> 
> Most new architectures that are added keep copying hacks and obsolete
> code from one of the existing trees, so it would be really nice to
> have a clean starting point for those who don't have as much time to
> find the correct solution as a CS student ;-).
> 
> You would surely learn a lot about the architecture specific parts
> of the kernel and do something useful without the danger of breaking
> code that other people depend on, but it's a lot of work.
> Maybe that can also be done by more that one person.

Sounds like an excellent idea to me! I'm eager to try `make ARCH=skeleton'!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

--===============077399138155640257==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============077399138155640257==--
