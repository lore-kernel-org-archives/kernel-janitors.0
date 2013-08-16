From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Fri, 16 Aug 2013 14:40:42 +0000
Subject: Re: [patch] mtd: create_freezable_workqueue() doesn't return an ERR_PTR
Message-Id: <1376664042.2089.378.camel@sauron.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130815075628.GC19280@elgon.mountain>
In-Reply-To: <20130815075628.GC19280@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org

On Thu, 2013-08-15 at 10:56 +0300, Dan Carpenter wrote:
> The create_freezable_workqueue() returns a NULL on error, it doesn't
> return an ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy

