From: Greg KH <greg@kroah.com>
Date: Thu, 16 Sep 2010 19:32:01 +0000
Subject: Re: [PATCH] staging: keucr: check kmalloc() return value
Message-Id: <20100916193201.GC10397@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317808-4850-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284317808-4850-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Al Cho <acho@novell.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sun, Sep 12, 2010 at 10:56:43PM +0400, Vasiliy Kulikov wrote:
> kmalloc() may fail, if so return error code.
> Also don't alloc 16 bytes from the heap, use stack instead.

Nope, you can't do that for USB drivers, sorry.  Please read the
documentation, it states this very clearly.

thanks,

greg k-h
