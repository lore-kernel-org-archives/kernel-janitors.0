From: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 29 Dec 2008 16:13:24 +0000
Subject: Re: [PATCH 10/13] drivers/usb/gadget: use USB API functions rather
Message-Id: <Pine.LNX.4.44L0.0812291111581.2250-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0812291628100.9555@pc-004.diku.dk>
References: <Pine.LNX.4.64.0812291122180.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812291122180.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, dbrownell@users.sourceforge.net, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 29 Dec 2008, Julia Lawall wrote:

> > ...
> > 
> > > diff --git a/drivers/usb/gadget/file_storage.c b/drivers/usb/gadget/file_storage.c
> > > index 88fedd0..c44092b 100644
> > > --- a/drivers/usb/gadget/file_storage.c
> > > +++ b/drivers/usb/gadget/file_storage.c
> > > @@ -248,6 +248,7 @@
> > >  #include <linux/freezer.h>
> > >  #include <linux/utsname.h>
> > >  
> > > +#include <linux/usb.h>
> > >  #include <linux/usb/ch9.h>
> > >  #include <linux/usb/gadget.h>
> > 
> > While there's nothing wrong with this part of the patch, it hardly 
> > seems necessary.  Was there any reason for including it?
> 
> The new functions are defined in usb.h. I have added the include in 
> this file and in the file epautoconf.c that this file includes.  If it is 
> removed from both, then the code does not compile (after make 
> allyesconfig):
> 
> In file included from drivers/usb/gadget/file_storage.c:268:
> drivers/usb/gadget/epautoconf.c: In function 'ep_matches':
> drivers/usb/gadget/epautoconf.c:79: error: implicit declaration of 
> function 'usb_endpoint_type'
> drivers/usb/gadget/epautoconf.c:122: error: implicit declaration of 
> function 'usb_endpoint_dir_in'
> make[1]: *** [drivers/usb/gadget/file_storage.o] Error 1
> make: *** [drivers/usb/gadget/file_storage.o] Error 2
> 
> While putting it in epautoconf.c would be sufficient, the includes
> 
> #include <linux/usb/ch9.h>
> #include <linux/usb/gadget.h>
> 
> are already repeated in both, so it would seem reasonable to repeat usb.h 
> in both as well.

Ah, but the declarations in ch9.h and gadget.h are used by both files, 
whereas the declarations in usb.h are used only by epautoconf.c.  Hence 
it seems most reasonable to #include usb.h only in epautoconf.c.

Alan Stern

