From: David Miller <davem@davemloft.net>
Date: Thu, 22 Mar 2012 23:30:50 +0000
Subject: Re: [patch] netlabel: use GFP flags from caller instead of GFP_ATOMIC
Message-Id: <20120322.193050.528451453813300397.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120322064101.GD7369@elgon.mountain>
In-Reply-To: <20120322064101.GD7369@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: paul@paul-moore.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Mar 2012 09:41:01 +0300

> This function takes a GFP flags as a parameter, but they are never used.
> We don't take a lock in this function so there is no reason to prefer
> GFP_ATOMIC over the caller's GFP flags.
> 
> There is only one caller, cipso_v4_map_cat_rng_ntoh(), and it passes
> GFP_ATOMIC as the GFP flags so this doesn't change how the code works.
> It's just a cleanup.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
