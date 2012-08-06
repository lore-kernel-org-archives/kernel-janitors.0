From: Julia.Lawall@lip6.fr
Date: Mon, 06 Aug 2012 19:57:27 +0000
Subject: Re: [PATCH 2/6] drivers/mfd: drop frees of devm allocated data
Message-Id: <20120806215727.60177hgs4k81txvw@webmail.lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344099049-15212-2-git-send-email-Julia.Lawall@lip6.fr>
 <20120806140515.GM4352@mwanda>
In-Reply-To: <20120806140515.GM4352@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Dan Carpenter <dan.carpenter@oracle.com>:

> On Sat, Aug 04, 2012 at 06:50:45PM +0200, Julia Lawall wrote:
>> diff --git a/drivers/mfd/88pm80x.c b/drivers/mfd/88pm80x.c
>> index cd0bf52..2bd090e 100644
>> --- a/drivers/mfd/88pm80x.c
>> +++ b/drivers/mfd/88pm80x.c
>> @@ -45,17 +45,14 @@ int __devinit pm80x_init(struct i2c_client *client,
>>
>>  	map = devm_regmap_init_i2c(client, &pm80x_regmap_config);
>>  	if (IS_ERR(map)) {
>> -		ret = PTR_ERR(map);
>>  		dev_err(&client->dev, "Failed to allocate register map: %d\n",
>>  			ret);
>                         ^^^
> The ret = PTR_ERR(map); is still needed for the error message.

Good point.  Thanks.  I will fix it as soon as possible, at the end of  
the week.

julia

>> -		goto err_regmap_init;
>> +		return PTR_ERR(map);
>>  	}
>
> regards,
> dan carpenter
>
>




