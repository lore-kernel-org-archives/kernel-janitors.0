From: Roger Luethi <rl@hellgate.ch>
Date: Sat, 29 May 2004 08:05:24 +0000
Subject: [Kernel-janitors] Re: 2.6.6: smc-ultra: eth%d message
Message-Id: <20040529080524.GA8950@k3.hellgate.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, 28 May 2004 10:27:30 +0200, N=E9meth M=E1rton wrote:
> When I'm loading smc-ultra module with 'modprobe -k smc_ultra' using
> Linux 2.6.6 I get the following message in 'dmesg':
>=20
> smc-ultra.c: Presently autoprobing (not recommended) for a single card.
> smc-ultra.c: No ISAPnP cards found, trying standard ones...
> smc-ultra.c:v2.02 2/3/98 Donald Becker (becker@cesdis.gsfc.nasa.gov)
> eth%d: SMC Ultra at 0x280, 00 00 C0 78 C5 B6, IRQ 3 memory 0xd0000-0xd3ff=
f.
>=20
> Using Linux kernel 2.4.25 the last line was correct, like this:
> eth0: SMC Ultra at 0x280, 00 00 C0 78 C5 B6, IRQ 3 memory 0xd0000-0xd3fff.
>=20
> I think the printk() in linux-2.6.6/drivers/net/smc-ultra.c:243 is buggy,
> but I do not have the knowledge how to correct this.

There are several drivers in 2.6 that use dev->name before calling
register_netdev(), which results in the "eth%d" messages you are seeing.
I've noticed this with mace.c as well (2.6.5 IIRC).

Maybe some KJ would like to pick that up?

Roger
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
