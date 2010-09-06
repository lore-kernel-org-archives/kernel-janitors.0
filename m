From: Dan Carpenter <error27@gmail.com>
Date: Mon, 06 Sep 2010 18:02:40 +0000
Subject: Re: [PATCH 06/14] staging: rtl8192u: improve error path
Message-Id: <20100906180240.GC2764@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711561-7332-1-git-send-email-segooon@gmail.com> <20100906101138.GA31249@bicker> <20100906135055.GA9632@albatros>
In-Reply-To: <20100906135055.GA9632@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, Julia Lawall <julia@diku.dk>, Ben Hutchings <ben@decadent.org.uk>, Mike Gilks <mike.kernel@gilksonline.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Mon, Sep 06, 2010 at 05:50:56PM +0400, Kulikov Vasiliy wrote:
> On Mon, Sep 06, 2010 at 12:11 +0200, Dan Carpenter wrote:
> > On Sun, Sep 05, 2010 at 10:32:41PM +0400, Kulikov Vasiliy wrote:
> > > +fail2:
> > > +	rtl8192_down(dev);
> > > +	if (priv->pFirmware) {
> > > +		kfree(priv->pFirmware);
> > > +		priv->pFirmware = NULL;
> > > +	}
> > > +	rtl8192_usb_deleteendpoints(dev);
> > > +	destroy_workqueue(priv->priv_wq);
> > > +	mdelay(10);
> > 
> > What's this delay for?
> 
> It was copied from rtl8192_usb_disconnect(), I don't know why it has
> mdelay(10). But it's better to keep the old deallocation code, it should
> have the same problems (if original code has any).
> 

I think the delay in rtl8192_usb_disconnect() is because we reset the
device.  (Of course, in that case, it would have been better to move the
delay into rtl8192_reset().  And also the reset code has been commented
out.)

In this case here, the delay is serves no purpose and should be removed.

regards,
dan carpenter
