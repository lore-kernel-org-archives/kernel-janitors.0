From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 29 Mar 2017 16:21:51 +0000
Subject: Re: [PATCH] Add checks for kmalloc allocation failures
Message-Id: <1490804511.24891.37.camel@edumazet-glaptop3.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170329155447.17991-1-colin.king@canonical.com>
In-Reply-To: <20170329155447.17991-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Harry Morris <h.morris@cascoda.com>, linuxdev@cascoda.com, Alexander Aring <aar@pengutronix.de>, Stefan Schmidt <stefan@osg.samsung.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2017-03-29 at 16:54 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Ensure we don't end up with a null pointer dereferences by checking
> for for allocation failures.  Allocate by sizeof(*ptr) rather than
> the type to fix checkpack warnings.  Also merge multiple lines into
> one line for the kmalloc call.
> 
> Detected by CoverityScan, CID#1422435 ("Dereference null return value")

OK, but could you change patch title to be less generic ?

Also, what tree is this patch targeting ?

# ls -l drivers/net/ieee802154/ca8210.c 
ls: cannot access drivers/net/ieee802154/ca8210.c: No such file or
directory

Thanks.


