From: Emil Goode <emilgoode@gmail.com>
Date: Mon, 26 May 2014 19:40:06 +0000
Subject: Re: [PATCH 1/3] driver core/platform: don't leak memory allocated for dma_mask
Message-Id: <20140526194006.GB23964@lianli>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401122483-31603-1-git-send-email-emilgoode@gmail.com>
 <20140526193046.GJ15585@mwanda>
In-Reply-To: <20140526193046.GJ15585@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hello,

On Mon, May 26, 2014 at 10:30:46PM +0300, Dan Carpenter wrote:
> On Mon, May 26, 2014 at 06:41:21PM +0200, Emil Goode wrote:
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index 9e9227e..dd1fa07 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -166,6 +166,7 @@ EXPORT_SYMBOL_GPL(platform_add_devices);
> >  struct platform_object {
> >  	struct platform_device pdev;
> >  	char name[1];
> > +	u64 dma_mask;
> >  };
> 
> Heh.  No this doesn't work as patch #1.  You have to have name at the
> end of the struct.

Yes I missed that one, obviously the order is important here.

Best regards,

Emil Goode
