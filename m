From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2020 19:35:45 +0000
Subject: Re: [PATCH] net: allwinner: Fix some resources leak in the error handling path of the probe and in t
Message-Id: <20201215193545.GJ2809@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214202117.146293-1-christophe.jaillet@wanadoo.fr>
 <20201215085655.ddacjfvogc3e33vz@gilmour>
 <20201215091153.GH2809@kadam>
 <20201215113710.wh4ezrvmqbpxd5yi@gilmour>
 <54194e3e-5eb1-d10c-4294-bac8f3933f47@wanadoo.fr>
 <20201215190815.6efzcqko55womf6b@gilmour>
In-Reply-To: <20201215190815.6efzcqko55womf6b@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Maxime Ripard <maxime@cerno.tech>
Cc: song.bao.hua@hisilicon.com, jernej.skrabec@siol.net, f.fainelli@gmail.com, leon@kernel.org, timur@kernel.org, netdev@vger.kernel.org, wangyunjian@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, wens@csie.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kuba@kernel.org, sr@denx.de, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com

On Tue, Dec 15, 2020 at 08:08:15PM +0100, Maxime Ripard wrote:
> On Tue, Dec 15, 2020 at 07:18:48PM +0100, Christophe JAILLET wrote:
> > Le 15/12/2020 =E0 12:37, Maxime Ripard a =E9crit=A0:
> > > On Tue, Dec 15, 2020 at 12:11:53PM +0300, Dan Carpenter wrote:
> > > > On Tue, Dec 15, 2020 at 09:56:55AM +0100, Maxime Ripard wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Mon, Dec 14, 2020 at 09:21:17PM +0100, Christophe JAILLET wrot=
e:
> > > > > > 'irq_of_parse_and_map()' should be balanced by a corresponding
> > > > > > 'irq_dispose_mapping()' call. Otherwise, there is some resource=
s leaks.
> > > > >=20
> > > > > Do you have a source to back that? It's not clear at all from the
> > > > > documentation for those functions, and couldn't find any user cal=
ling it
> > > > > from the ten-or-so random picks I took.
> > > >=20
> > > > It looks like irq_create_of_mapping() needs to be freed with
> > > > irq_dispose_mapping() so this is correct.
> > >=20
> > > The doc should be updated first to make that clear then, otherwise we=
're
> > > going to fix one user while multiples will have poped up
> > >=20
> > > Maxime
> > >=20
> >=20
> > Hi,
> >=20
> > as Dan explained, I think that 'irq_dispose_mapping()' is needed becaus=
e of
> > the 'irq_create_of_mapping()" within 'irq_of_parse_and_map()'.
> >=20
> > As you suggest, I'll propose a doc update to make it clear and more fut=
ure
> > proof.
>=20
> Thanks :)
>=20
> And if you feel like it, a coccinelle script would be awesome too so
> that other users get fixed over time
>=20
> Maxime

Smatch has a new check for resource leaks which hopefully people will
find useful.

https://github.com/error27/smatch/blob/master/check_unwind.c

To check for these I would need to add the following lines to the table:

        { "irq_of_parse_and_map", ALLOC, -1, "$", &int_one, &int_max},
        { "irq_create_of_mapping", ALLOC, -1, "$", &int_one, &int_max},
        { "irq_dispose_mapping", RELEASE, 0, "$"},

The '-1, "$"' means the returned value.  irq_of_parse_and_map() and
irq_create_of_mapping() return positive int on success.

The irq_dispose_mapping() frees its zeroth parameter so it's listed as
'0, "$"'.  We don't care about the returns from irq_dispose_mapping().

It doesn't apply in this case but if a function frees a struct member
then that's listed as '0, "$->member_name"'.

regards,
dan carpenter
