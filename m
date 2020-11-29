From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 29 Nov 2020 20:14:39 +0000
Subject: Re: [PATCH] Input: Fix a ref counting issue
Message-Id: <b10e44bf-d3a6-f2a2-d47b-7a6f561cf6c6@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201129084516.1456099-1-christophe.jaillet@wanadoo.fr>
 <20201129194918.GL2034289@dtor-ws>
In-Reply-To: <20201129194918.GL2034289@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: rydberg@euromail.se, tj@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Le 29/11/2020 à 20:49, Dmitry Torokhov a écrit :
> Hi Christophe,
>
> On Sun, Nov 29, 2020 at 09:45:16AM +0100, Christophe JAILLET wrote:
>> In case of a managed resource, 'devm_input_device_release()' already has a
>> 'input_put_device(dev)' call.
>>
>> Avoid a double reference decrement by explicitly calling
>> 'input_put_device()' only on non-managed input device.
> This patch is incorrect, as devres_destroy() that is used in
> input_free_device(), unlike devres_releasde(), does not actually call
> the "release" function. It simply destroys the devres object, but does
> not clear associated resources.

Crystal clear.
Thanks for the explanation and sorry for the noise.

CJ

>> Fixes: 2be975c6d920 ("Input: introduce managed input devices (add devres support)")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> This patch is completely speculative and compile tested only.
>> ---
>>   drivers/input/input.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/input.c b/drivers/input/input.c
>> index 3cfd2c18eebd..c09c9f020667 100644
>> --- a/drivers/input/input.c
>> +++ b/drivers/input/input.c
>> @@ -1920,7 +1920,8 @@ void input_free_device(struct input_dev *dev)
>>   						devm_input_device_release,
>>   						devm_input_device_match,
>>   						dev));
>> -		input_put_device(dev);
>> +		else
>> +			input_put_device(dev);
>>   	}
>>   }
>>   EXPORT_SYMBOL(input_free_device);
>> -- 
>> 2.27.0
>>
> Thanks.
>
