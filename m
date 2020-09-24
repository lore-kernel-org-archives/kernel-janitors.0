From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Sep 2020 06:49:32 +0000
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in 'lp50xx_probe_dt()'
Message-Id: <20200924064932.GP18329@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
 <20200923133510.GJ4282@kadam>
 <faa49efc-5ba5-b6bd-b486-2f7c4611219b@wanadoo.fr>
In-Reply-To: <faa49efc-5ba5-b6bd-b486-2f7c4611219b@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, pavel@ucw.cz, dmurphy@ti.com, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 23, 2020 at 08:49:56PM +0200, Christophe JAILLET wrote:
> Le 23/09/2020 =E0 15:35, Dan Carpenter a =E9crit=A0:
> > I've added Heikki Krogerus to the CC list because my question is mostly
> > about commit 59abd83672f7 ("drivers: base: Introducing software nodes to
> > the firmware node framework").
> >=20
> > I have been trying to teach Smatch to understand reference counting so
> > it can discover these kinds of bugs automatically.
> >=20
> > I don't know how software_node_get_next_child() can work when it doesn't
> > call kobject_get().  This sort of bug would have been caught in testing
> > because it affects the success path so I must be reading the code wrong.
> >=20
>=20
> I had the same reading of the code and thought that I was missing somethi=
ng
> somewhere.
>=20
> There is the same question about 'acpi_get_next_subnode' which is also a
> '.get_next_child_node' function, without any ref counting, if I'm correct.
>=20

Yeah, but there aren't any ->get/put() ops for the acpi_get_next_subnode()
stuff so it's not a problem.  (Presumably there is some other sort of
refcounting policy there).

regards,
dan carpenter
