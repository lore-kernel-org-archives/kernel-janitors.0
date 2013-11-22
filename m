From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Nov 2013 08:29:07 +0000
Subject: Re: [PATCH] tty: replace mutex_lock() with tty_write_lock()
Message-Id: <20131122082907.GB5302@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1385061132-7254-1-git-send-email-andi.platschek@gmail.com>
 <528F112B.4090404@bfs.de>
In-Reply-To: <528F112B.4090404@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Andreas Platschek <andi.platschek@gmail.com>, gregkh@linuxfoundation.org, jslaby@suse.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 22, 2013 at 09:09:15AM +0100, walter harms wrote:
> 
> 
> Am 21.11.2013 20:12, schrieb Andreas Platschek:
> > Use tty_write_lock()/tty_write_unlock() consistently.
> > 
> > This takes care of the following sparse warning:
> > drivers/tty/tty_io.c:1169:17: warning: context imbalance in 'tty_write_message' - unexpected unlock
> > 
> > Signed-off-by: Andreas Platschek <andi.platschek@gmail.com>
> > ---
> >  drivers/tty/tty_io.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> > index 3a1a01a..13dca92 100644
> > --- a/drivers/tty/tty_io.c
> > +++ b/drivers/tty/tty_io.c
> > @@ -1165,7 +1165,7 @@ out:
> >  void tty_write_message(struct tty_struct *tty, char *msg)
> >  {
> >  	if (tty) {
> > -		mutex_lock(&tty->atomic_write_lock);
> > +		tty_write_lock(tty,0);
> >  		tty_lock(tty);
> >  		if (tty->ops->write && !test_bit(TTY_CLOSING, &tty->flags)) {
> >  			tty_unlock(tty);
> 
> i am not an expert on this but you may need to replace that tty_unlock() with tty_write_unlock().

No.  The original code is correct.

regards,
dan carpenter

