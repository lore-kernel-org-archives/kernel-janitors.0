From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Mar 2018 09:34:55 +0000
Subject: Re: [media] ov5645: Move an error code assignment in ov5645_probe()
Message-Id: <21b0f618-4f54-633a-6411-0790628d6498@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4efad917-ca08-f257-e9a1-b5bcb7df2df2@users.sourceforge.net>
 <20180314221702.5rtdttyqjcpysjkd@kekkonen.localdomain>
In-Reply-To: <20180314221702.5rtdttyqjcpysjkd@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Hans Verkuil <hansverk@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Todor Tomov <todor.tomov@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Move an assignment for a specific error code so that it is stored only once
>> in this function implementation.
>>
>> This issue was detected by using the Coccinelle software.
> 
> How?

Would you like to experiment a bit more with the following approach
for the semantic patch language?

show_same_statements3.cocci:

@duplicated_code@
identifier work;
statement s1, s2;
type T;
@@
 T work(...)
 {
 ... when any
*if ((...) < 0)
*{
    ...
*   s1
*   s2
*}
 ... when any
*if ((...) < 0)
*{
    ...
*   s1
*   s2
*}
 ... when any
 }


>> @@ -1334,6 +1329,7 @@ static int ov5645_probe(struct i2c_client *client,
>>  
>>  power_down:
>>  	ov5645_s_power(&ov5645->sd, false);
>> +	ret = -ENODEV;
> 
> I don't think this is where people would expect you to set the error code
> in general.

This can be. - The view depends on some factors.


> It should rather take place before goto, not after it.

I proposed another software design direction.


> That'd mean another variable,

To which detail do you refer here?


> and I'm not convinced the result would improve the driver.

Can you see the relevance of a small code reduction in this function?

Regards,
Markus
