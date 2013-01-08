From: Markus Grabner <grabner@icg.tugraz.at>
Date: Tue, 08 Jan 2013 22:54:25 +0000
Subject: Re: [patch 2/2] staging: line6: use after free bug requesting version
Message-Id: <2084008.1cLbf3atnB@medialab>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Donnerstag, 6. Dezember 2012, 10:08:44 schrieb Dan Carpenter:
> On Thu, Dec 06, 2012 at 06:18:02AM +0100, Stefan Hajnoczi wrote:
> > On Wed, Dec 5, 2012 at 7:44 PM, Dan Carpenter <dan.carpenter@oracle.com> 
wrote:
> > > diff --git a/drivers/staging/line6/driver.c
> > > b/drivers/staging/line6/driver.c index 8a5d89e..884e0d8 100644
> > > --- a/drivers/staging/line6/driver.c
> > > +++ b/drivers/staging/line6/driver.c
> > > @@ -110,7 +110,7 @@ struct message {
> > > 
> > >  */
> > >  static void line6_data_received(struct urb *urb);
> > >  static int line6_send_raw_message_async_part(struct message *msg,
> > > 
> > > -                                            struct urb *urb);
> > > +                                            struct urb *urb, int free);
> > 
> > s/int/bool/
> > 
> > >  /*
> > >  
> > >         Start to listen on endpoint.
> > > 
> > > @@ -219,24 +219,42 @@ static void line6_async_request_sent(struct urb
> > > *urb)
> > > 
> > >                 usb_free_urb(urb);
> > >                 kfree(msg);
> > >         
> > >         } else
> > > 
> > > -               line6_send_raw_message_async_part(msg, urb);
> > > +               line6_send_raw_message_async_part(msg, urb, 0);
> > > +}
> > 
> > I'd add a bool free_buffer field to struct message and simply modify
> > line6_async_request_sent() to do:
> > 
> > if (msg->free_buffer)
> > 
> >          kfree(msg->buffer);
> > 
> > Then you don't need line6_async_request_sent_free_buffer() and
> > line6_send_raw_message_async_part() doesn't need to take a bool free
> > argument since struct message already contains that information.  It
> > would make the code simpler.
> 
> Yeah.  That's true.  I'll redo it.
Since two users reported this bug to me recently, I proposed a fix and asked 
them to test it. If it works for them, I'll prepare a patch against Stefan's 
repository. This is for your information only to avoid duplicate work in case 
you just wanted to pick this up again.

	Kind regards,
		Markus

