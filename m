From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Date: Tue, 20 Oct 2020 17:10:07 +0000
Subject: Re: [PATCH] media: staging: rkisp1: rsz: make const array static, makes object smaller
Message-Id: <cec23fd3-15c1-8e52-3f4d-300d6149d89c@collabora.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201020144655.53251-1-colin.king@canonical.com>
 <d5663dec063440129bf6c373aa252d51@AcuMS.aculab.com>
In-Reply-To: <d5663dec063440129bf6c373aa252d51@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>, 'Colin King' <colin.king@canonical.com>, Helen Koike <helen.koike@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



Am 20.10.20 um 17:29 schrieb David Laight:
> From: Colin King
>> Sent: 20 October 2020 15:47
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Don't populate the const array dev_names on the stack but instead it
>> static. Makes the object code smaller by 15 bytes.
>>
>> Before:
>>     text	   data	    bss	    dec	    hex	filename
>>    17091	   2648	     64	  19803	   4d5b	media/rkisp1/rkisp1-resizer.o
>>
>> After:
>>     text	   data	    bss	    dec	    hex	filename
>>    17012	   2712	     64	  19788	   4d4c	media/rkisp1/rkisp1-resizer.o
>>
>> (gcc version 10.2.0)
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-resizer.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-
>> resizer.c
>> index 1687d82e6c68..7ca5b47c5bf5 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> @@ -763,8 +763,10 @@ static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
>>
>>   static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
>>   {
>> -	const char * const dev_names[] = {RKISP1_RSZ_MP_DEV_NAME,
>> -					  RKISP1_RSZ_SP_DEV_NAME};
>> +	static const char * const dev_names[] = {
>> +		RKISP1_RSZ_MP_DEV_NAME,
>> +		RKISP1_RSZ_SP_DEV_NAME
>> +	};
>>   	struct media_pad *pads = rsz->pads;
>>   	struct v4l2_subdev *sd = &rsz->sd;
>>   	int ret;
> 
> Don't look at what that code is actually doing....
> It is rather horrid.
> rkisp1_rsz_register() is called for each entry in an array (twice).
> The array index is written into rsz->id.
> The value is then used to select one of the two strings.
> But rsz->id is actually an enum type.

Hi,
Is it that bad to use enum as an array index?
we use it in many places in the driver.

Thanks,
Dafna

> 
> rkisp1_rsz_register() should probably just be called twice with some
> extra parameters.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
