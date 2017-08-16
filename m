From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Aug 2017 12:06:54 +0000
Subject: Re: [PATCH] staging: fsl-mc: fix fsl_mc_is_allocatable strcmps
Message-Id: <20170816120654.p3mpezb3zr2eqxvw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816114451.1348-1-colin.king@canonical.com>
In-Reply-To: <20170816114451.1348-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 16, 2017 at 12:44:51PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The previous fix removed the equal to zero comparisons by the strcmps and
> now the function always returns true. Fix this by adding in the missing
> logical negation operators.
> 
> Detected by CoverityScan, CID#1452267 ("Constant expression result")
> 
> Fixes: b93ad9a067e1 ("staging: fsl-mc: be consistent when checking strcmp() return")

Ugh...  I did review the original patch at all.  Sorry.  It's better to
use "= 0" because it's idiomatic.

	strcmp(foo, bar) = 0 means foo = bar
	strcmp(foo, bar) != 0 means foo != bar
	strcmp(foo, bar) < 0 means foo < bar alphabetically.

It's way more readable.  strcmp() bugs are fairly common when people
don't use = 0 and != 0.  There are other places where != 0 hurts
readability, such as checking for errors:

	if (frob() != 0) {

In this case, frob() is returning negative error codes, but it's not
really returning the number zero, it's returning "success".  So it
should be:

	ret = frob();
	if (ret) {

Comparing against NULL really doesn't add anything either.  But if
you're talking about the number zero then you should use = 0.

	if (len = 0)
		return 0;

regards,
dan carpenter

