From: Joe Perches <joe@perches.com>
Date: Sat, 24 Sep 2016 16:47:36 +0000
Subject: Re: [PATCH 4/4] Input-gameport: Replace some printk() calls by pr_info() in joydump_connect()
Message-Id: <1474735656.23838.6.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8da8333-d83a-ca61-b887-7fd7528c63a4@users.sourceforge.net>
         <f486d64d-0759-9cd6-1e4e-df723acb6fea@users.sourceforge.net>
         <1474733610.23838.2.camel@perches.com>
         <8164eb48-e3fa-fa9d-6351-f14b595a6dc3@users.sourceforge.net>
In-Reply-To: <8164eb48-e3fa-fa9d-6351-f14b595a6dc3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sat, 2016-09-24 at 18:32 +0200, SF Markus Elfring wrote:
> > > @@ -57,27 +57,29 @@ static int joydump_connect(struct gameport *gamep=
ort, struct gameport_driver *dr
> > > =A0	unsigned long flags;
> > > =A0	unsigned char u;
> >=20
> > =A0
> > > -	printk(KERN_INFO "joydump: ,------------------ START --------------=
--.\n");
> > > -	printk(KERN_INFO "joydump: | Dumping: %30s |\n", gameport->phys);
> > > -	printk(KERN_INFO "joydump: | Speed: %28d kHz |\n", gameport->speed);
> > > +	pr_info(",------------------ START ----------------.\n"
> > > +		"| Dumping: %30s |\n"
> > > +		"| Speed: %28d kHz |\n",
> > > +		gameport->phys,
> > > +		gameport->speed);
>=20
>=20
> > Not the same output.
>=20
>=20
> Should the desired output be the same when the relevant data are passed b=
y a single function call
> (instead of three as before)?

Adding a singleton for a pr_fmt #define constant string and
updating the printk subsystem to prepend that constant string
to each use of a pr_<level> at runtime would be an improvement
as it could reduce constant data used by the format strings.

That would be a _real_ improvement.

Please try to implement something like that before submitting
more of these incorrect patches.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
