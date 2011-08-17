From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Date: Wed, 17 Aug 2011 18:42:56 +0000
Subject: Re: [patch] w1: off by one in w1_f29_remove_slave()
Message-Id: <56274C82-8FCA-45F9-B3DC-9863889694AA@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727095557.GL3824@shale.localdomain> <9C2475AA-829E-4BB8-A3D2-2444803A33D3@gmail.com> <4E33C3F5.9000602@bfs.de> <20110730085131.GE5575@shale.localdomain>
In-Reply-To: <20110730085131.GE5575@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: walter harms <wharms@bfs.de>, Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


On Jul 30, 2011, at 4:51, Dan Carpenter wrote:

> On Sat, Jul 30, 2011 at 10:42:29AM +0200, walter harms wrote:
>> Is there any reason to release the data "backwards" ?
>> The default way is to go upwards. that looks more readable.
>=20
> I considered doing it that way.  It would work.  I throught maybe
> they were going to add something where it needed to be unwound LIFO
> order.
>=20
> I'll wait for Jean-Fran=E7oisto say which way is prefered.
>=20
Sorry for the delay. Sorry also for the trouble this dummy copy/paste mista=
ke is causing. It's a bit embarrassing even if the intentions are good ;) T=
his second mistake explains why I wasn't getting ill effects from the remov=
e.

The sysfs files were removed backwards as a programmer reflex. In this case=
 it is not really necessary since there are no real dependencies between th=
e function implementations... but there may be in the future. This is why i=
t's a safe habit to do it this way.

I would keep the removal in reverse order,  so I will ack the the v2 patch

Cheers!
/jfd
> regards,
> dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
