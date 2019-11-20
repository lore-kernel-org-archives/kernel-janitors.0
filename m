From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 20 Nov 2019 19:47:09 +0000
Subject: Re: [PATCH -next] usb: gadget: configfs: Fix missing spin_lock_init()
Message-Id: <20191120194709.GA3092233@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191030034046.188808-1-weiyongjun1@huawei.com>
 <20191030081101.GF26815@b29397-desktop>
 <CAL411-pVmtTr58YFmsotcY+w2KR3kR1hQ1bJOG9CNA-fmPQYGg@mail.gmail.com>
In-Reply-To: <CAL411-pVmtTr58YFmsotcY+w2KR3kR1hQ1bJOG9CNA-fmPQYGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Nov 18, 2019 at 05:09:39PM +0800, Peter Chen wrote:
> BR,
> Peter Chen
> 
> On Wed, Oct 30, 2019 at 4:12 PM Peter Chen <peter.chen@nxp.com> wrote:
> >
> > On 19-10-30 03:40:46, Wei Yongjun wrote:
> > > The driver allocates the spinlock but not initialize it.
> > > Use spin_lock_init() on it to initialize it correctly.
> > >
> > > This is detected by Coccinelle semantic patch.
> > >
> > > Fixes: 1a1c851bbd70 ("usb: gadget: configfs: fix concurrent issue between composite APIs")
> > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > > ---
> > >  drivers/usb/gadget/configfs.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> > > index 33852c2b29d1..ab9ac48a751a 100644
> > > --- a/drivers/usb/gadget/configfs.c
> > > +++ b/drivers/usb/gadget/configfs.c
> > > @@ -1544,6 +1544,7 @@ static struct config_group *gadgets_make(
> > >       gi->composite.resume = NULL;
> > >       gi->composite.max_speed = USB_SPEED_SUPER;
> > >
> > > +     spin_lock_init(&gi->spinlock);
> > >       mutex_init(&gi->lock);
> > >       INIT_LIST_HEAD(&gi->string_list);
> > >       INIT_LIST_HEAD(&gi->available_func);
> > >
> >
> > Reviewed-by: Peter Chen <peter.chen@nxp.com>
> 
> Hi Felipe & Greg,
> 
> We may need this patch for usb/next and usb/linus tree, otherwise, there will
> be kernel dump if enable lockdep:

Ok, now queued up.

thanks,

greg k-h
