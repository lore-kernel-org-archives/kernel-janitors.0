From: Dan Carpenter <error27@gmail.com>
Date: Thu, 09 Jun 2011 07:58:23 +0000
Subject: Re: [patch] b43: check for allocation failures
Message-Id: <20110609075813.GG4069@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110609070934.GE4069@shale.localdomain>
 <BANLkTim3zJNJfGHcaeY+PQN3wm1m20Qzjw@mail.gmail.com>
In-Reply-To: <BANLkTim3zJNJfGHcaeY+PQN3wm1m20Qzjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Stefano Brivio <stefano.brivio@polimi.it>, kernel-janitors@vger.kernel.org, "open list:B43 WIRELESS DRIVER" <linux-wireless@vger.kernel.org>, "John W. Linville" <linville@tuxdriver.com>

On Thu, Jun 09, 2011 at 09:43:44AM +0200, Rafał Miłecki wrote:
> >        dev = b43_bus_dev_ssb_init(sdev);
> > +       if (!dev)
> > +               return -ENOMEM;
> 
> I'm not sure if you should be aware of the reason here. What about returning
> error code by b43_bus_dev..., reporting it here with b43err and returning
> ENODEV or sth?

The kmalloc failure prints out a whole lot of crap.  Surely we don't
need to add more code in every function for an error that is almost
certainly not going to happen in real life.

If we were really worried about returning the right error code, then
we'd return an ERR_PTR() from the lower levels etc.  I don't think
it's worth it though.

regards,
dan carpenter
