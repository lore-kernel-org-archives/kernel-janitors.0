From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Jan 2013 06:25:11 +0000
Subject: Re: [patch 2/2] staging: line6: use after free bug requesting version
Message-Id: <20130109062511.GT7302@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121205184452.GB18227@elgon.mountain>
In-Reply-To: <20121205184452.GB18227@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 08, 2013 at 11:54:25PM +0100, Markus Grabner wrote:
> Am Donnerstag, 6. Dezember 2012, 10:08:44 schrieb Dan Carpenter:
> > On Thu, Dec 06, 2012 at 06:18:02AM +0100, Stefan Hajnoczi wrote:
> > > On Wed, Dec 5, 2012 at 7:44 PM, Dan Carpenter <dan.carpenter@oracle.com> 
> wrote:
> > > > diff --git a/drivers/staging/line6/driver.c
> > > > b/drivers/staging/line6/driver.c index 8a5d89e..884e0d8 100644
> > > > --- a/drivers/staging/line6/driver.c
> > > > +++ b/drivers/staging/line6/driver.c
> > > > @@ -110,7 +110,7 @@ struct message {
> > > > 
> > > >  */
> > > >  static void line6_data_received(struct urb *urb);
> > > >  static int line6_send_raw_message_async_part(struct message *msg,
> > > > 
> > > > -                                            struct urb *urb);
> > > > +                                            struct urb *urb, int free);
> > > 
> > > s/int/bool/
> > > 
> > > >  /*
> > > >  
> > > >         Start to listen on endpoint.
> > > > 
> > > > @@ -219,24 +219,42 @@ static void line6_async_request_sent(struct urb
> > > > *urb)
> > > > 
> > > >                 usb_free_urb(urb);
> > > >                 kfree(msg);
> > > >         
> > > >         } else
> > > > 
> > > > -               line6_send_raw_message_async_part(msg, urb);
> > > > +               line6_send_raw_message_async_part(msg, urb, 0);
> > > > +}
> > > 
> > > I'd add a bool free_buffer field to struct message and simply modify
> > > line6_async_request_sent() to do:
> > > 
> > > if (msg->free_buffer)
> > > 
> > >          kfree(msg->buffer);
> > > 
> > > Then you don't need line6_async_request_sent_free_buffer() and
> > > line6_send_raw_message_async_part() doesn't need to take a bool free
> > > argument since struct message already contains that information.  It
> > > would make the code simpler.
> > 
> > Yeah.  That's true.  I'll redo it.
> Since two users reported this bug to me recently, I proposed a fix and asked 
> them to test it. If it works for them, I'll prepare a patch against Stefan's 
> repository. This is for your information only to avoid duplicate work in case 
> you just wanted to pick this up again.
> 

Crap...  I'm sorry.  I completely lost track of this.  Please send
your patch.

regards,
dan carpenter

