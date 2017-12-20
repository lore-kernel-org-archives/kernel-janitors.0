From: walter harms <wharms@bfs.de>
Date: Wed, 20 Dec 2017 12:27:48 +0000
Subject: Re: [PATCH v1 05/10] staging: atomisp: Remove non-ACPI leftovers
Message-Id: <5A3A5744.20404@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171220053828.5wphhl6oc2sl3su5@mwanda>
In-Reply-To: <20171220053828.5wphhl6oc2sl3su5@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 20.12.2017 11:30, schrieb Julia Lawall:
> 
> 
> On Wed, 20 Dec 2017, Dan Carpenter wrote:
> 
>> On Tue, Dec 19, 2017 at 10:59:52PM +0200, Andy Shevchenko wrote:
>>> @@ -914,9 +904,7 @@ static int lm3554_probe(struct i2c_client *client)
>>>  		dev_err(&client->dev, "gpio request/direction_output fail");
>>>  		goto fail2;
>>>  	}
>>> -	if (ACPI_HANDLE(&client->dev))
>>> -		err = atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
>>> -	return 0;
>>> +	return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
>>>  fail2:
>>>  	media_entity_cleanup(&flash->sd.entity);
>>>  	v4l2_ctrl_handler_free(&flash->ctrl_handler);
>>
>> Actually every place where we directly return a function call is wrong
>> and needs error handling added.  I've been meaning to write a Smatch
>> check for this because it's a common anti-pattern we don't check the
>> last function call for errors.
>>
>> Someone could probably do the same in Coccinelle if they want.
> 
> I'm not sure what you are suggesting.  Is every case of return f(...);
> for any f wrong?  Or is it a particular function that is of concern?  Or
> would it be that every function call that has error handling somewhere
> should have error handling everywhere?  Or is it related to what seems to
> be the problem in the above code that err is initialized but nothing
> happens to it?
> 

I guess the idea is to check if a return value gets set and then discarded
because the function returns const.

IMHO this is a case of write-never read like that series what Colin King fixed lately.

re,
 wh
