From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 16 Aug 2017 14:14:23 +0000
Subject: Re: [PATCH] staging: fsl-mc: fix fsl_mc_is_allocatable strcmps
Message-Id: <c0556f57-3bdf-7dd8-5e53-b2f86ce33ad6@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816114451.1348-1-colin.king@canonical.com>
 <20170816120654.p3mpezb3zr2eqxvw@mwanda> <59944AB2.6010809@nxp.com>
In-Reply-To: <59944AB2.6010809@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stuart Yoder <stuyoder@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wei Yongjun <weiyongjun1@huawei.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 16/08/17 14:37, Laurentiu Tudor wrote:
> On 08/16/2017 03:06 PM, Dan Carpenter wrote:
>> On Wed, Aug 16, 2017 at 12:44:51PM +0100, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> The previous fix removed the equal to zero comparisons by the strcmps and
>>> now the function always returns true. Fix this by adding in the missing
>>> logical negation operators.
>>>
>>> Detected by CoverityScan, CID#1452267 ("Constant expression result")
>>>
>>> Fixes: b93ad9a067e1 ("staging: fsl-mc: be consistent when checking strcmp() return")
> 
> Thanks Colin (and Coverity) for catching this!
> 
>> Ugh...  I did review the original patch at all.  Sorry.
> 
> As a side note, funny how i got the patch description right but not the 
> actual patch. :-)
> 
>> It's better to use "= 0" because it's idiomatic.
> 
> Agree, plus this approach would be consistent with the rest of the 
> driver (except one place in drivers/staging/fsl-mc/bus/dprc-driver.c +32)

OK, I'll send a revert sometime today as that seems the sane solution.

Colin
> 
> ---
> Best Regards, Laurentiu--
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

