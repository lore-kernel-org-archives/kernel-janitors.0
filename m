From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jul 2013 05:56:07 +0000
Subject: Re: [patch] mtd: use correct error codes in debugfs_create()
Message-Id: <20130722055607.GF5636@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719054938.GC9729@elgon.mountain>
In-Reply-To: <20130719054938.GC9729@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Akinobu Mita <akinobu.mita@gmail.com>

On Fri, Jul 19, 2013 at 08:49:38AM +0300, Dan Carpenter wrote:
> The test here is reversed.  It should be that if "dent" is a valid error
> code then we use it, otherwise if it is NULL then use -ENODEV.
> 

People have explained the debugfs_create API to me better and now
I'm not sure what to do here...  debugfs_create_dir() returns a
NULL on error and if debugfs is not enabled then it returns -ENODEV.
We test for if (!IS_ENABLED(CONFIG_DEBUG_FS)) earlier in the
function so it can only return NULL.

Probably I should just change the test to only test for NULL?

Otherwise I think my patch is correct.  The original code will
return success on error (NULL return) and that was not intended.

regards,
dan carpenter

