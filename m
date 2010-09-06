From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 06 Sep 2010 13:50:56 +0000
Subject: Re: [PATCH 06/14] staging: rtl8192u: improve error path
Message-Id: <20100906135055.GA9632@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711561-7332-1-git-send-email-segooon@gmail.com>
 <20100906101138.GA31249@bicker>
In-Reply-To: <20100906101138.GA31249@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, Julia Lawall <julia@diku.dk>, Ben Hutchings <ben@decadent.org.uk>, Mike Gilks <mike.kernel@gilksonline.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Mon, Sep 06, 2010 at 12:11 +0200, Dan Carpenter wrote:
> On Sun, Sep 05, 2010 at 10:32:41PM +0400, Kulikov Vasiliy wrote:
> > +fail2:
> > +	rtl8192_down(dev);
> > +	if (priv->pFirmware) {
> > +		kfree(priv->pFirmware);
> > +		priv->pFirmware = NULL;
> > +	}
> > +	rtl8192_usb_deleteendpoints(dev);
> > +	destroy_workqueue(priv->priv_wq);
> > +	mdelay(10);
> 
> What's this delay for?

It was copied from rtl8192_usb_disconnect(), I don't know why it has
mdelay(10). But it's better to keep the old deallocation code, it should
have the same problems (if original code has any).

-- 
Vasiliy
