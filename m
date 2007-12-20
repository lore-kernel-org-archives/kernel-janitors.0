From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 20 Dec 2007 17:35:31 +0000
Subject: Re: [parisc-linux] [PATCH] alpha/parisc: Removing config variable
Message-Id: <20071220093531.101c51b7.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <473C065D.1000000@gmail.com>
In-Reply-To: <473C065D.1000000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 20 Dec 2007 12:07:00 -0500 Kyle McMartin <kyle@mcmartin.ca> wrote:

> On Thu, Nov 15, 2007 at 09:42:05AM +0100, Jiri Olsa wrote:
> > Removing config variable DEBUG_RWLOCK, since it is not used
> > 
> > Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
> 
> ack.
> 
> Andrew, should I apply the parisc half of this, or do you want to
> queue the whole patch?
> 

I can take care of it.  Jiri, next time please do this sort of thing as
separate patches: alpha and parisc changes get into the mainline tree via
different routes (ie: via different maintainer trees).

Thanks.
