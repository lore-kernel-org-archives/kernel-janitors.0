From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Oct 2017 13:43:27 +0000
Subject: Re: [PATCH] iio/adc/palmas: Use common error handling code in palmas_gpadc_calibrate()
Message-Id: <bcd5b722-fe10-8ea0-0f90-662cb414b4c0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ae3662d-6a74-622c-0423-e8552ea79bca@users.sourceforge.net>
 <20171026173314.0bd5fd27@archlinux>
In-Reply-To: <20171026173314.0bd5fd27@archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc: Alison Schofield <amsfield22@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> @@ -329,6 +325,10 @@ static int palmas_gpadc_calibrate(struct palmas_gpadc *adc, int adc_chan)
>>  
>>  scrub:
>>  	return ret;
>> +
>> +report_failure:
> 
> This makes for complex code flow where it is not needed.

The shown code layout would be required in the suggested software design direction.


> As such I am not going to even think about taking this sort of patch.

It might take more time until similar situations will be reconsidered.


>> +	dev_err(adc->dev, "TRIM read failed: %d\n", ret);
>> +	goto scrub;
>>  }
>>  
>>  static int palmas_gpadc_start_conversion(struct palmas_gpadc *adc, int adc_chan)

Do any other contributors find a bit of code reduction desirable for this
software module?

Regards,
Markus
