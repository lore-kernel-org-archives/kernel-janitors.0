From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Date: Wed, 16 Aug 2017 13:37:55 +0000
Subject: Re: [PATCH] staging: fsl-mc: fix fsl_mc_is_allocatable strcmps
Message-Id: <59944AB2.6010809@nxp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816114451.1348-1-colin.king@canonical.com>
 <20170816120654.p3mpezb3zr2eqxvw@mwanda>
In-Reply-To: <20170816120654.p3mpezb3zr2eqxvw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Colin King <colin.king@canonical.com>
Cc: Stuart Yoder <stuyoder@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wei Yongjun <weiyongjun1@huawei.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 08/16/2017 03:06 PM, Dan Carpenter wrote:
> On Wed, Aug 16, 2017 at 12:44:51PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The previous fix removed the equal to zero comparisons by the strcmps and
>> now the function always returns true. Fix this by adding in the missing
>> logical negation operators.
>>
>> Detected by CoverityScan, CID#1452267 ("Constant expression result")
>>
>> Fixes: b93ad9a067e1 ("staging: fsl-mc: be consistent when checking strcmp() return")

Thanks Colin (and Coverity) for catching this!

> Ugh...  I did review the original patch at all.  Sorry.

As a side note, funny how i got the patch description right but not the 
actual patch. :-)

> It's better to use "== 0" because it's idiomatic.

Agree, plus this approach would be consistent with the rest of the 
driver (except one place in drivers/staging/fsl-mc/bus/dprc-driver.c +32)

---
Best Regards, Laurentiu