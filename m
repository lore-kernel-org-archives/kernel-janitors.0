From: Julia Lawall <julia@diku.dk>
Date: Fri, 07 Aug 2009 19:56:48 +0000
Subject: Re: [PATCH] drivers/scsi: Check NULL for kmalloc() return
Message-Id: <Pine.LNX.4.64.0908072155260.8253@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090807183953.GA22286@fencepost.gnu.org>
 <Pine.LNX.4.64.0908072054080.8253@ask.diku.dk> <20090807194429.GA23615@fencepost.gnu.org>
In-Reply-To: <20090807194429.GA23615@fencepost.gnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Davidlohr Bueso A." <dave@gnu.org>
Cc: kraxel@bytesex.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 7 Aug 2009, Davidlohr Bueso A. wrote:

> On Fri, Aug 07, 2009 at 08:54:44PM +0200, Julia Lawall wrote:
> > On Fri, 7 Aug 2009, Davidlohr Bueso A. wrote:
> > 
> > > Verify that ch->dt is not NULL before using it:
> > > ch-dt[elem] = value;
> > 
> > It looks like buffer should be freed as well?
> 
> The way I see it, this is done in ch_remove()

I don't see that at all.  buffer appears to be a variable that is local to 
ch_readconfig and is passed down to other functions, but never saved 
anywhere.  Furthermore buffer is freed in the normal exit of the function, 
so it seems likely that it should be freed on an early exit as well.

julia
