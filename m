From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 09 Aug 2013 09:23:06 +0000
Subject: Re: rfc: ARRAY_AND_SIZE
Message-Id: <alpine.DEB.2.02.1308091119520.2295@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5204A345.5060605@bfs.de>
In-Reply-To: <5204A345.5060605@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 9 Aug 2013, Dan Carpenter wrote:

> It's mostly used like this:
>
> static struct ltq_pmx_func falcon_funcs[] = {
> 	{"rst",         ARRAY_AND_SIZE(ltq_rst_grps)},
> 	{"ntr",         ARRAY_AND_SIZE(ltq_ntr_grps)},
> 	{"mdio",        ARRAY_AND_SIZE(ltq_mdio_grps)},
> 	{"led",         ARRAY_AND_SIZE(ltq_bled_grps)},
> 	{"asc",         ARRAY_AND_SIZE(ltq_asc_grps)},
> 	{"spi",         ARRAY_AND_SIZE(ltq_spi_grps)},
> 	{"i2c",         ARRAY_AND_SIZE(ltq_i2c_grps)},
> 	{"jtag",        ARRAY_AND_SIZE(ltq_jtag_grps)},
> 	{"slic",        ARRAY_AND_SIZE(ltq_slic_grps)},
> 	{"pcm",         ARRAY_AND_SIZE(ltq_pcm_grps)},
> };
>
> That's fine.
>
> There are a few times when it's used as function parameters, which
> looks like garbage.  If I were the maintainer, I would change it,
> but I'm not so it's not worth arguing with maintainers about
> something they did deliberately.

Actually, it is used 226 times as function arguments, in 77 files.  It is
used 39 times in a structure declaration.

julia
