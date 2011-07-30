From: Dan Carpenter <error27@gmail.com>
Date: Sat, 30 Jul 2011 08:51:31 +0000
Subject: Re: [patch] w1: off by one in w1_f29_remove_slave()
Message-Id: <20110730085131.GE5575@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727095557.GL3824@shale.localdomain>
 <9C2475AA-829E-4BB8-A3D2-2444803A33D3@gmail.com>
 <4E33C3F5.9000602@bfs.de>
In-Reply-To: <4E33C3F5.9000602@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: walter harms <wharms@bfs.de>
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Dagenais <jeff.dagenais@gmail.com>, Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jul 30, 2011 at 10:42:29AM +0200, walter harms wrote:
> Is there any reason to release the data "backwards" ?
> The default way is to go upwards. that looks more readable.

I considered doing it that way.  It would work.  I throught maybe
they were going to add something where it needed to be unwound LIFO
order.

I'll wait for Jean-Fran=E7oisto say which way is prefered.

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
