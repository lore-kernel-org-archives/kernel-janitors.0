From: "Miller, Mike (OS Dev)" <mike.miller@hp.com>
Date: Tue, 18 Jan 2005 19:00:02 +0000
Subject: RE: [KJ] RE: [PATCH 3/22] block/cciss: replace schedule_timeout()
Message-Id: <D4CFB69C345C394284E4B78B876C1CF107DC01A9@cceexc23.americas.cpqcorp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <D4CFB69C345C394284E4B78B876C1CF107DC01A4@cceexc23.americas.cpqcorp.net>
In-Reply-To: <D4CFB69C345C394284E4B78B876C1CF107DC01A4@cceexc23.americas.cpqcorp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> From: Greg KH [mailto:greg@kroah.com]
> Subject: Re: [KJ] RE: [PATCH 3/22] block/cciss: replace
> schedule_timeout() with msleep()
> 
> 
> On Mon, Jan 17, 2005 at 04:14:10PM -0600, Miller, Mike (OS Dev) wrote:
> > I still fail to see the benefits of this patch.
> 
> When HZ changed from 100 to 1000, your code went from 
> sleeping 10ms to 1
> ms.  Did you really mean that?  This way, your code always sleeps what
> you expect it to sleep, no matter what the value of HZ.
> 
> thanks,
> 
> greg k-h

I went back thru the code.

Acked-by: Mike Miller <mike.miller@hp.com>


> 
> 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
