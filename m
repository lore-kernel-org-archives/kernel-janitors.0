From: Julia Lawall <julia@diku.dk>
Date: Thu, 11 Aug 2011 09:52:41 +0000
Subject: Re: [PATCH] net/netlabel/netlabel_kapi.c: add missing cleanup code
Message-Id: <Pine.LNX.4.64.1108111152130.18938@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313055633-25327-1-git-send-email-julia@diku.dk>
 <20110811094407.GG3777@shale.localdomain>
In-Reply-To: <20110811094407.GG3777@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 11 Aug 2011, Dan Carpenter wrote:

> On Thu, Aug 11, 2011 at 11:40:33AM +0200, Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> > 
> > Use the same cleanup code for the failure of kzalloc as for the failure of
> > kstrdup just below.
> > 
> 
> That doesn't work.  The kfree(entry->domain) would cause an oops.

Of course...  Thanks!

julia
