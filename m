From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Aug 2017 12:10:14 +0000
Subject: Re: [PATCH] staging: fsl-mc: fix fsl_mc_is_allocatable strcmps
Message-Id: <20170816121014.7bbeipqxxccx7okm@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816114451.1348-1-colin.king@canonical.com>
 <20170816120654.p3mpezb3zr2eqxvw@mwanda>
In-Reply-To: <20170816120654.p3mpezb3zr2eqxvw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Stuart Yoder <stuyoder@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>

On Wed, Aug 16, 2017 at 03:06:54PM +0300, Dan Carpenter wrote:
> On Wed, Aug 16, 2017 at 12:44:51PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The previous fix removed the equal to zero comparisons by the strcmps and
> > now the function always returns true. Fix this by adding in the missing
> > logical negation operators.
> > 
> > Detected by CoverityScan, CID#1452267 ("Constant expression result")
> > 
> > Fixes: b93ad9a067e1 ("staging: fsl-mc: be consistent when checking strcmp() return")
> 
> Ugh...  I did review the original patch at all.  Sorry.

s/did/did not/

regards,
dan carpenter

