From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Tue, 09 Mar 2004 21:29:22 +0000
Subject: Re: [Kernel-janitors] [PATCH] - mm/slab.c : init section usage.
Message-Id: <1078867761.28746.9.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1077825651.31019.33.camel@telecentrolivre>
In-Reply-To: <1077825651.31019.33.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Randy,

Em Ter, 2004-03-09 =E0s 16:51, Randy.Dunlap escreveu:
> On Thu, 26 Feb 2004 17:00:51 -0300 Luiz Fernando Capitulino wrote:
> | diff -X dontdiff -pNru linux-2.6.3-bk8/mm/slab.c linux-2.6.3-bk8~/mm/sl=
ab.c
> | --- linux-2.6.3-bk8/mm/slab.c	2004-02-26 13:33:15.000000000 -0300
> | +++ linux-2.6.3-bk8~/mm/slab.c	2004-02-26 13:08:03.000000000 -0300
> | @@ -566,7 +566,7 @@ static void __slab_error(const char *fun
> |   * Add the CPU number into the expiry time to minimize the possibility=
 of the
> |   * CPUs getting into lockstep and contending for the global cache chai=
n lock.
> |   */
> | -static void start_cpu_timer(int cpu)
> | +static void __init start_cpu_timer(int cpu)
> |  {
> |  	struct timer_list *rt =3D &per_cpu(reap_timers, cpu);
> | =20
>=20
> I don't see how this is a good patch.  start_cpu_timer() can be
> called from cpuup_callback():: case CPU_ONLINE, which I think can
> happen after kernel init.  Anyone else check this?

 I think cpuup_callback() is called only at the startup.

 But if I'm wrong, you can drop this patch (of course !! :-)).

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
