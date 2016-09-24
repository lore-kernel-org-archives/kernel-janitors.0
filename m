From: Joe Perches <joe@perches.com>
Date: Sat, 24 Sep 2016 16:13:30 +0000
Subject: Re: [PATCH 4/4] Input-gameport: Replace some printk() calls by pr_info() in joydump_connect()
Message-Id: <1474733610.23838.2.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8da8333-d83a-ca61-b887-7fd7528c63a4@users.sourceforge.net>
         <f486d64d-0759-9cd6-1e4e-df723acb6fea@users.sourceforge.net>
In-Reply-To: <f486d64d-0759-9cd6-1e4e-df723acb6fea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sat, 2016-09-24 at 15:50 +0200, SF Markus Elfring wrote:

> * Prefer usage of the macro "pr_info" over the interface "printk"
>=A0  in this function.
> * Reduce number of output function calls.

Did you test this?  I doubt it.

> diff --git a/drivers/input/joystick/joydump.c b/drivers/input/joystick/jo=
ydump.c
[]
> @@ -57,27 +57,29 @@ static int joydump_connect(struct gameport *gameport,=
 struct gameport_driver *dr
> > =A0	unsigned long flags;
> > =A0	unsigned char u;
> =A0
> > -	printk(KERN_INFO "joydump: ,------------------ START ----------------=
.\n");
> > -	printk(KERN_INFO "joydump: | Dumping: %30s |\n", gameport->phys);
> > -	printk(KERN_INFO "joydump: | Speed: %28d kHz |\n", gameport->speed);
> > +	pr_info(",------------------ START ----------------.\n"
> > +		"| Dumping: %30s |\n"
> > +		"| Speed: %28d kHz |\n",
> > +		gameport->phys,
> > +		gameport->speed);

Not the same output.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
