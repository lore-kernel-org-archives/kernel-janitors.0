From: Greg KH <greg@kroah.com>
Date: Mon, 18 Sep 2006 12:31:42 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/base
Message-Id: <20060918123142.GA8242@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171753m2a047081qc2982bf4a693a044@mail.gmail.com>
In-Reply-To: <6b4e42d10609171753m2a047081qc2982bf4a693a044@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Om Narasimhan <om.turyx@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Sun, Sep 17, 2006 at 05:53:58PM -0700, Om Narasimhan wrote:
> Tested by compiling.
> 
> Signed off by Om Narasimhan <om.turyx@gmail.com>
> 
> 
> drivers/base/class.c          |    2 +-
>  drivers/base/dmapool.c        |    4 ++--
>  drivers/base/firmware_class.c |    2 +-
>  drivers/base/map.c            |    4 ++--
>  drivers/base/platform.c       |    4 ++--
>  5 files changed, 8 insertions(+), 8 deletions(-)

No, sorry, none of these changes are needed.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
