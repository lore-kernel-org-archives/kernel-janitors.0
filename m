From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 13 Feb 2020 13:04:04 +0000
Subject: Re: [PATCH] usb: typec: ucsi: remove redundant assignment to variable num
Message-Id: <20200213130404.GA3369961@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208165022.30429-1-colin.king@canonical.com>
 <20200213113423.GK1498@kuha.fi.intel.com>
In-Reply-To: <20200213113423.GK1498@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Colin King <colin.king@canonical.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 13, 2020 at 01:34:23PM +0200, Heikki Krogerus wrote:
> On Sat, Feb 08, 2020 at 04:50:22PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Variable num is being assigned with a value that is never read, it is
> > assigned a new value later in a for-loop. The assignment is redundant
> > and can be removed.
> > 
> > Addresses-Coverity: ("Unused value")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index d5a6aac86327..b1b72cb7af10 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -400,7 +400,7 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
> >  	struct typec_altmode_desc desc;
> >  	struct ucsi_altmode alt[2];
> >  	u64 command;
> > -	int num = 1;
> > +	int num;
> >  	int ret;
> >  	int len;
> >  	int j;
> 
> Greg! I'll pick this, and to you with a few other patches that I have
> in my queue for the ucsi driver. I hope that's OK.

Thats fine.
