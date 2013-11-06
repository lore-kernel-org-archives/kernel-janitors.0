From: Kishon Vijay Abraham I <kishon@ti.com>
Date: Wed, 06 Nov 2013 08:23:26 +0000
Subject: Re: [patch] drivers: phy: tweaks to phy_create()
Message-Id: <5279F9AE.303@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131106075412.GB13475@elgon.mountain>
In-Reply-To: <20131106075412.GB13475@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Felipe Balbi <balbi@ti.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi,

On Wednesday 06 November 2013 01:24 PM, Dan Carpenter wrote:
> If this was called with a NULL "dev" then it lead to a NULL dereference
> when we called dev_WARN().  I have changed it to WARN_ON() so that we
> get a stack dump and can fix the caller.
>
> If ida_simple_get() failed then there was a missing call to kfree(phy).

There was already a patch fixing it.
git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git fixes
>
> The rest of this patch is just cleanup like returning directly instead
> of having do-nothing gotos.  Using descriptive labels instead of

Grouping the err returns in the end looked a bit cleaner to me. It's 
just a matter of preference I guess.
> GW-BASIC style "err0" and "err1".  I also flipped the order of
> put_device() and ida_remove() so they are a mirror reflection of the
> order they were allocated.
>

Thanks
Kishon
