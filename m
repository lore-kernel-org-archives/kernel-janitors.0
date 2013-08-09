From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Aug 2013 09:10:31 +0000
Subject: Re: rfc: ARRAY_AND_SIZE
Message-Id: <20130809091031.GH5502@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5204A345.5060605@bfs.de>
In-Reply-To: <5204A345.5060605@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

It's mostly used like this:

static struct ltq_pmx_func falcon_funcs[] = {
	{"rst",         ARRAY_AND_SIZE(ltq_rst_grps)},
	{"ntr",         ARRAY_AND_SIZE(ltq_ntr_grps)},
	{"mdio",        ARRAY_AND_SIZE(ltq_mdio_grps)},
	{"led",         ARRAY_AND_SIZE(ltq_bled_grps)},
	{"asc",         ARRAY_AND_SIZE(ltq_asc_grps)},
	{"spi",         ARRAY_AND_SIZE(ltq_spi_grps)},
	{"i2c",         ARRAY_AND_SIZE(ltq_i2c_grps)},
	{"jtag",        ARRAY_AND_SIZE(ltq_jtag_grps)},
	{"slic",        ARRAY_AND_SIZE(ltq_slic_grps)},
	{"pcm",         ARRAY_AND_SIZE(ltq_pcm_grps)},
};

That's fine.

There are a few times when it's used as function parameters, which
looks like garbage.  If I were the maintainer, I would change it,
but I'm not so it's not worth arguing with maintainers about
something they did deliberately.

regards,
dan carpenter

