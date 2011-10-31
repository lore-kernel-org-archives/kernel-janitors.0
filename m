From: Jonathan Cameron <jic23@cam.ac.uk>
Date: Mon, 31 Oct 2011 11:22:52 +0000
Subject: Re: [patch] Staging: iio/dac/ad5064.c: signedness bug in ad5064_read_raw()
Message-Id: <4EAE850C.8040103@cam.ac.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111029072042.GC17780@elgon.mountain> <4EAD2A97.8090103@metafoo.de>
In-Reply-To: <4EAD2A97.8090103@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@suse.de>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

On 10/30/11 10:44, Lars-Peter Clausen wrote:
> On 10/29/2011 09:20 AM, Dan Carpenter wrote:
>> regulator_get_voltage() returns an int so "scale_uv" should be an
>> int.  Making it unsigned here breaks the error handling.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> uhm, yes...
> 
> Acked-by: Lars-Peter Clausen <lars@metafoo.de>
Acked-by: Jonathan Cameron <jic23@cam.ac.uk>
> 
> Thanks.
> 
>>
>> diff --git a/drivers/staging/iio/dac/ad5064.c b/drivers/staging/iio/dac/ad5064.c
>> index 24279f2..3b14526 100644
>> --- a/drivers/staging/iio/dac/ad5064.c
>> +++ b/drivers/staging/iio/dac/ad5064.c
>> @@ -280,8 +280,8 @@ static int ad5064_read_raw(struct iio_dev *indio_dev,
>>  			   long m)
>>  {
>>  	struct ad5064_state *st = iio_priv(indio_dev);
>> -	unsigned long scale_uv;
>>  	unsigned int vref;
>> +	int scale_uv;
>>  
>>  	switch (m) {
>>  	case 0:
> 
> 

