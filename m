From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 09 Mar 2004 22:15:12 +0000
Subject: Re: [Kernel-janitors] [PATCH] - mm/slab.c : init section usage.
Message-Id: <20040309141512.4e90a696.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1077825651.31019.33.camel@telecentrolivre>
In-Reply-To: <1077825651.31019.33.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, 09 Mar 2004 18:29:22 -0300 Luiz Fernando Capitulino wrote:

|=20
| Hi Randy,
|=20
| Em Ter, 2004-03-09 =E0s 16:51, Randy.Dunlap escreveu:
| > On Thu, 26 Feb 2004 17:00:51 -0300 Luiz Fernando Capitulino wrote:
| > | diff -X dontdiff -pNru linux-2.6.3-bk8/mm/slab.c linux-2.6.3-bk8~/mm/=
slab.c
| > | --- linux-2.6.3-bk8/mm/slab.c	2004-02-26 13:33:15.000000000 -0300
| > | +++ linux-2.6.3-bk8~/mm/slab.c	2004-02-26 13:08:03.000000000 -0300
| > | @@ -566,7 +566,7 @@ static void __slab_error(const char *fun
| > |   * Add the CPU number into the expiry time to minimize the possibili=
ty of the
| > |   * CPUs getting into lockstep and contending for the global cache ch=
ain lock.
| > |   */
| > | -static void start_cpu_timer(int cpu)
| > | +static void __init start_cpu_timer(int cpu)
| > |  {
| > |  	struct timer_list *rt =3D &per_cpu(reap_timers, cpu);
| > | =20
| >=20
| > I don't see how this is a good patch.  start_cpu_timer() can be
| > called from cpuup_callback():: case CPU_ONLINE, which I think can
| > happen after kernel init.  Anyone else check this?
|=20
|  I think cpuup_callback() is called only at the startup.
|=20
|  But if I'm wrong, you can drop this patch (of course !! :-)).

Yes, looks like cpu_up() is only called during init.
If this ever changes (e.g., for hotplug cpu), this __init will
have to be removed, but it looks correct for now.

Thanks.

--
~Randy

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
