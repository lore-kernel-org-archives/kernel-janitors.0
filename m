From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Tue, 04 Feb 2014 07:45:55 +0000
Subject: Re: [patch] UBI: fix some use after free bugs
Message-Id: <1391499955.1795.32.camel@sauron.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140129131756.GC10678@elgon.mountain>
In-Reply-To: <20140129131756.GC10678@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org

On Wed, 2014-01-29 at 16:17 +0300, Dan Carpenter wrote:
> Move the kmem_cache_free() calls down a couple lines.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to linux-ubifs.git, thanks!

I'll send this to Linus for 3.13 inclusion.

-- 
Best Regards,
Artem Bityutskiy

