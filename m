From: David Miller <davem@davemloft.net>
Date: Wed, 24 Mar 2010 20:36:56 +0000
Subject: Re: [patch] wimax: remove unneeded variable
Message-Id: <20100324.133656.200772463.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100324115603.GD21571@bicker>
In-Reply-To: <20100324115603.GD21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, andre.goddard@gmail.com, adobriyan@gmail.com, jkosina@suse.cz, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Mar 2010 14:56:03 +0300

> We never actually use "dev" so I removed it.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

I think the intention was to pass it into to these
stupid function call tracing debugging macros the
WIMAX stuff has.  It's passing NULL currently.

Anyways, I've applied this, thanks.

But seriously, why is every developer of some new subsystem or driver
inclined to add such ugly debugging infrastructure?  It's seemingly
the first thing they do before writing any code.

I'd very much like to see a patch that removes all of this junk and
"rm -f include/linux/wimax/debug.h"
