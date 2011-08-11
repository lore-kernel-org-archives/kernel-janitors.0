From: Dan Carpenter <error27@gmail.com>
Date: Thu, 11 Aug 2011 09:44:07 +0000
Subject: Re: [PATCH] net/netlabel/netlabel_kapi.c: add missing cleanup code
Message-Id: <20110811094407.GG3777@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313055633-25327-1-git-send-email-julia@diku.dk>
In-Reply-To: <1313055633-25327-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Paul Moore <paul@paul-moore.com>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 11, 2011 at 11:40:33AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use the same cleanup code for the failure of kzalloc as for the failure of
> kstrdup just below.
> 

That doesn't work.  The kfree(entry->domain) would cause an oops.

regards,
dan carpenter

