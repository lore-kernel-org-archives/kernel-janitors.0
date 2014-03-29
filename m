From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 29 Mar 2014 09:58:52 +0000
Subject: Re: [patch] iio: adc: checking for NULL instead of IS_ERR() in probe
Message-Id: <5336995C.90701@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140328083126.GO25192@mwanda> <CAGH8bx77dKAm7w53F5MfTXaPm6KxQcVCXERnW-oXmR5Ww-HLTw@mail.gmail.com>
In-Reply-To: <CAGH8bx77dKAm7w53F5MfTXaPm6KxQcVCXERnW-oXmR5Ww-HLTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: johannes thumshirn <morbidrsa@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 28/03/14 14:07, johannes thumshirn wrote:
> On Fri, Mar 28, 2014 at 9:33 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>
>> mcb_request_mem() returns an ERR_PTR(), it doesn't return NULL.
>>
>> Fixes: 74aeac4da66f ('iio: adc: Add MEN 16z188 ADC driver')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/iio/adc/men_z188_adc.c b/drivers/iio/adc/men_z188_adc.c
>> index 6989c16..b58d630 100644
>> --- a/drivers/iio/adc/men_z188_adc.c
>> +++ b/drivers/iio/adc/men_z188_adc.c
>> @@ -121,8 +121,8 @@ static int men_z188_probe(struct mcb_device *dev,
>>          indio_dev->num_channels = ARRAY_SIZE(z188_adc_iio_channels);
>>
>>          mem = mcb_request_mem(dev, "z188-adc");
>> -       if (!mem)
>> -               return -ENOMEM;
>> +       if (IS_ERR(mem))
>> +               return PTR_ERR(mem);
>>
>>          adc->base = ioremap(mem->start, resource_size(mem));
>>          if (adc->base = NULL)
>
> Acked-by: Johannes Thumshirn <johannes.thumshirn@men.de>
>
Acked-by: Jonathan Cameron <jic23@kernel.org>

Or I can pick this up after the merge window has closed if Greg hasn't
already taken it.

Jonathan
