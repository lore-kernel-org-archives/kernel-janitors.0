From: Peter Hurley <peter@hurleysoftware.com>
Date: Tue, 11 Nov 2014 17:19:41 +0000
Subject: Re: tty: Change tty lock order to master->slave
Message-Id: <5462452D.8020306@hurleysoftware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141111125011.GA12942@mwanda>
In-Reply-To: <20141111125011.GA12942@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, linux-next <linux-next@vger.kernel.org>

On 11/11/2014 07:50 AM, Dan Carpenter wrote:
> Hello Peter Hurley,
>
> The patch 2aff5e2bc62d: "tty: Change tty lock order to master->slave"
> from Nov 5, 2014, leads to the following static checker warning:
>
> 	drivers/tty/tty_mutex.c:50 tty_lock_slave()
> 	warn: add some parenthesis here?
>
> drivers/tty/tty_mutex.c
>     47  void __lockfunc tty_lock_slave(struct tty_struct *tty)
>     48  {
>     49          if (tty && tty != tty->link) {
>     50                  WARN_ON(!mutex_is_locked(&tty->link->legacy_mutex) ||
>     51                          !tty->driver->type = TTY_DRIVER_TYPE_PTY ||
>     52                          !tty->driver->type = PTY_TYPE_SLAVE);
>
> ! has high precedence than = so those tests are never true.  != doesn't
> make sense either.  Probably the negate operatons are just copy-and-paste
> errors?

Thanks for catching this, Dan.

Unfortunately, this is not a copy-and-paste error; apparently, emacs cannot
code-what-I-mean rather than code-what-I-type.

The warning is not necessary now; when I respun this series with fixed lock
subclasses I should have ripped this out. I will send a patch forthwith.

Regards,
Peter Hurley


>     53                  tty_lock(tty);
>     54          }
>     55  }
>
> regards,
> dan carpenter

