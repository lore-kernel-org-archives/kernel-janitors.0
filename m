From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 16 Feb 2019 09:38:17 +0000
Subject: Re: [PATCH -next] media: vimc: remove set but not used variable 'frame_size'
Message-Id: <ae50788b-ba39-db3e-4d94-cc13ba09e6bb@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216022438.32242-1-yuehaibing@huawei.com>
 <3f24847f-0557-5660-19de-1ef003f15524@xs4all.nl>
In-Reply-To: <3f24847f-0557-5660-19de-1ef003f15524@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Helen Koike <helen.koike@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org


On 2019/2/16 17:25, Hans Verkuil wrote:
> On 2/16/19 3:24 AM, YueHaibing wrote:
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> drivers/media/platform/vimc/vimc-sensor.c: In function 'vimc_sen_process_frame':
>> drivers/media/platform/vimc/vimc-sensor.c:208:15: warning:
>>  variable 'frame_size' set but not used [-Wunused-but-set-variable]
>>
>> It's never used since introduction.
> 
> A patch for this is already pending in a pull request.

Thank you for info.

> 
> Regards,
> 
> 	Hans
> 
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/media/platform/vimc/vimc-sensor.c | 7 -------
>>  1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
>> index 93961a1e694f..59195f262623 100644
>> --- a/drivers/media/platform/vimc/vimc-sensor.c
>> +++ b/drivers/media/platform/vimc/vimc-sensor.c
>> @@ -204,13 +204,6 @@ static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>>  {
>>  	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
>>  						    ved);
>> -	const struct vimc_pix_map *vpix;
>> -	unsigned int frame_size;
>> -
>> -	/* Calculate the frame size */
>> -	vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
>> -	frame_size = vsen->mbus_format.width * vpix->bpp *
>> -		     vsen->mbus_format.height;
>>  
>>  	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
>>  	return vsen->frame;
>>
>>
>>
> 
> 
> .
> 
