From: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 28 Jan 2014 05:32:46 +0000
Subject: Re: [patch v2] mtd: sm_ftl: heap corruption in sm_create_sysfs_attributes()
Message-Id: <20140128053246.GF3162@norris-Latitude-E6410>
List-Id: <kernel-janitors.vger.kernel.org>
References: <52A06B00.7070309@bfs.de> <20131205145349.GA13302@elgon.mountain>
In-Reply-To: <20131205145349.GA13302@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, walter harms <wharms@bfs.de>

On Thu, Dec 05, 2013 at 05:53:50PM +0300, Dan Carpenter wrote:
> We always put a NUL terminator one space past the end of the "vendor"
> buffer.  Walter Harms also pointed out that this should just use
> kstrndup().
> 
> Fixes: 7d17c02a01a1 ('mtd: Add new SmartMedia/xD FTL')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch looks good.

> ---
> v2:  Use kstrndup().
>      Don't subtract 1 from the strnlen() limiter for the NUL.  I think
>      it's ok to go over?

I don't think you're "going over" anything. You're just (correctly)
allocating the buffer as (at most) one byte larger than (SM_SMALL_PAGE -
SM_CIS_VENDOR_OFFSET), which is perfect if you're copying up to
(SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET) bytes of character data.

Pushed to l2-mtd.git/next, queued for 3.15. Thanks.

Brian
