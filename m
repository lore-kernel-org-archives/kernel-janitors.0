From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Nov 2014 12:50:11 +0000
Subject: re: tty: Change tty lock order to master->slave
Message-Id: <20141111125011.GA12942@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Peter Hurley,

The patch 2aff5e2bc62d: "tty: Change tty lock order to master->slave"
from Nov 5, 2014, leads to the following static checker warning:

	drivers/tty/tty_mutex.c:50 tty_lock_slave()
	warn: add some parenthesis here?

drivers/tty/tty_mutex.c
    47  void __lockfunc tty_lock_slave(struct tty_struct *tty)
    48  {
    49          if (tty && tty != tty->link) {
    50                  WARN_ON(!mutex_is_locked(&tty->link->legacy_mutex) ||
    51                          !tty->driver->type = TTY_DRIVER_TYPE_PTY ||
    52                          !tty->driver->type = PTY_TYPE_SLAVE);

! has high precedence than = so those tests are never true.  != doesn't
make sense either.  Probably the negate operatons are just copy-and-paste
errors?

    53                  tty_lock(tty);
    54          }
    55  }

regards,
dan carpenter
