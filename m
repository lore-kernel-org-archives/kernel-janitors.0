From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 02 Mar 2015 21:39:42 +0000
Subject: Re: [PATCH 1/7] mtd: docg3: drop dead code
Message-Id: <87mw3v13kx.fsf@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
 <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
 <20150302091050.GC5386@mwanda>
In-Reply-To: <20150302091050.GC5386@mwanda> (Dan Carpenter's message of "Mon,
 2 Mar 2015 12:10:50 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Joe Perches <joe@perches.com>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Sat, Feb 28, 2015 at 02:02:24AM -0800, Brian Norris wrote:
>> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
>> index 448ce42f951e..01eddea1f0d9 100644
>> --- a/drivers/mtd/devices/docg3.c
>> +++ b/drivers/mtd/devices/docg3.c
>> @@ -2079,8 +2079,6 @@ static int __init docg3_probe(struct platform_device *pdev)
>>  	ret = doc_register_sysfs(pdev, cascade);
>>  	if (ret)
>>  		goto err_probe;
>> -	if (!found)
>> -		goto notfound;
>
> Just delete the "found" variable because there are no other uses.
Yes, and yes.

For both changes (condition killing, found++ eradication and found variable
declaration) :
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert
