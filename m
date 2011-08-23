From: Dan Carpenter <error27@gmail.com>
Date: Tue, 23 Aug 2011 19:13:06 +0000
Subject: Re: [patch -next] bcma: signedness bug in bcma_get_next_core()
Message-Id: <20110823191306.GK12248@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110818133809.GG4786@shale.localdomain>
 <CACna6rzwxA=OzQQ_VknsSq8BXXoH8U=GpdfkRTBWjFSNSjwsAA@mail.gmail.com>
In-Reply-To: <CACna6rzwxA=OzQQ_VknsSq8BXXoH8U=GpdfkRTBWjFSNSjwsAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "open list:BROADCOM SPECIFIC..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Aug 20, 2011 at 02:23:56PM +0200, Rafał Miłecki wrote:
> W dniu 18 sierpnia 2011 15:38 użytkownik Dan Carpenter
> <error27@gmail.com> napisał:
> > The u32 would never be less than zero so the error handling would
> > break.  I changed it to int.
> 
> In declaration we use s32:
> static s32 bcma_erom_get_mst_port(struct bcma_bus *bus, u32 **eromptr);
> 
> Doesn't it sound better to use s32 instead of int?
>

I don't know.  I think I'm going to trust the original author on this
one.  I'll send you a v2 that uses s32.

regards,
dan carpenter

