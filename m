From: =?iso-8859-2?Q?N=E9meth_M=E1rton?= <nm127@hszk.bme.hu>
Date: Mon, 31 May 2004 06:57:55 +0000
Subject: [Kernel-janitors] Re: 2.6.6: smc-ultra: eth%d message
Message-Id: <Pine.GSO.4.58.0405310837380.9769@ural2>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20058321963504788=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040529080524.GA8950@k3.hellgate.ch>
In-Reply-To: <20040529080524.GA8950@k3.hellgate.ch>
To: kernel-janitors@vger.kernel.org

--===============20058321963504788==
Content-Type: TEXT/PLAIN; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi!

I tried to write a 'Smatch' ( http://smatch.sourceforge.net/ ) script to
help searching for the problem below.

The question that the script would check is that is any
'struct net_device'.'name' accessed by any read-out expression before
calling register_netdev().

It seems to me that 'Smatch' does not provide enough information for this:

----------------------------------------------------------------
linux-2.6.6/drivers/net/smc-ultra.c:243 is:
    printk("%s: %s at %#3x,", dev->name, model_name, ioaddr);

smc-ultra.c.sm contains:
SM drivers/net/smc-ultra.c 243 expr_stmt call_expr((addr_expr function_decl=
(printk))(tree_list: addr_expr string_cst(""%s: %s at %#3x,""), non_lvalue_=
expr parm_decl(dev), var_decl(model_name), parm_decl(ioaddr)))
----------------------------------------------------------------


and the pointer type of 'dev' is also not known:

----------------------------------------------------------------
linux-2.6.6/drivers/net/smc-ultra.c:206 is:
static int __init ultra_probe1(struct net_device *dev, int ioaddr)

smc-ultra.c.sm:
SM drivers/net/smc-ultra.c 207 function_decl integer_type function_decl(ult=
ra_probe1)(pointer_type(parm_decl(dev)), integer_type(parm_decl(ioaddr)))
----------------------------------------------------------------

Is it possible to update 'Smatch' to let the check possible?

	NMarci


On Sat, 29 May 2004, Roger Luethi wrote:

> On Fri, 28 May 2004 10:27:30 +0200, N=E9meth M=E1rton wrote:
> > When I'm loading smc-ultra module with 'modprobe -k smc_ultra' using
> > Linux 2.6.6 I get the following message in 'dmesg':
> >
> > smc-ultra.c: Presently autoprobing (not recommended) for a single card.
> > smc-ultra.c: No ISAPnP cards found, trying standard ones...
> > smc-ultra.c:v2.02 2/3/98 Donald Becker (becker@cesdis.gsfc.nasa.gov)
> > eth%d: SMC Ultra at 0x280, 00 00 C0 78 C5 B6, IRQ 3 memory 0xd0000-0xd3=
fff.
> >
> > Using Linux kernel 2.4.25 the last line was correct, like this:
> > eth0: SMC Ultra at 0x280, 00 00 C0 78 C5 B6, IRQ 3 memory 0xd0000-0xd3f=
ff.
> >
> > I think the printk() in linux-2.6.6/drivers/net/smc-ultra.c:243 is bugg=
y,
> > but I do not have the knowledge how to correct this.
>
> There are several drivers in 2.6 that use dev->name before calling
> register_netdev(), which results in the "eth%d" messages you are seeing.
> I've noticed this with mace.c as well (2.6.5 IIRC).




--===============20058321963504788==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20058321963504788==--
