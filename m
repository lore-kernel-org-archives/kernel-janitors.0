From: Pavel Machek <pavel@ucw.cz>
Date: Thu, 30 May 2013 09:38:49 +0000
Subject: Re: [Patch] Staging: winbond: usb_free_urb(NULL) is safe
Message-Id: <20130530093849.GA11173@amd.pavel.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A6D6F6.1050204@gmail.com>
In-Reply-To: <51A6D6F6.1050204@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu 2013-05-30 07:11:24, Julia Lawall wrote:
> > diff -uprN a/drivers/staging/winbond/wb35reg.c b/drivers/staging/winbond/wb35reg.c
> > --- a/drivers/staging/winbond/wb35reg.c	2013-05-28 00:52:26.000000000 +0530
> > +++ b/drivers/staging/winbond/wb35reg.c	2013-05-28 02:11:35.000000000 +0530
> > @@ -64,12 +64,11 @@ unsigned char Wb35Reg_BurstWrite(struct
> >  
> >  		return true;
> >  	} else {
> > -		if (urb)
> > -			usb_free_urb(urb);
> > +		usb_free_urb(urb);
> 
> I took a look at this case.  Wouldn't it be nicer to check for failures 
> one by one, as done almost everywhere else in the kernel?  Then you would 
> know what had been successfully allocated and what has to be freed.

Yeah, that code needs lot of improvements. No, we probably will not
make it perfect by single patch.

(Original patch:)

Acked-by: Pavel Machek <pavel@ucw.cz>

Does someone have the hardware, BTW? I have single instance here, I
need to power it up some day. It was apparently sold as an USB card,
too... (I have version built-in obscure netbook).

     	      	    	      	     		     	   Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
