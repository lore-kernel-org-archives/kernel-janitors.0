From: maowenan <maowenan@huawei.com>
Date: Mon, 11 Mar 2019 14:17:12 +0000
Subject: Re: [PATCH] staging: davinci: drop pointless static qualifier in vpfe_resizer_init()
Message-Id: <7021aa62-e311-edfc-68b2-3a5dba11118f@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190311141405.123611-1-maowenan@huawei.com>
 <20190311140733.GG2434@kadam>
In-Reply-To: <20190311140733.GG2434@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Julia.Lawall@lip6.fr, kimbrownkd@gmail.com, colin.king@canonical.com, hans.verkuil@cisco.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org



On 2019/3/11 22:07, Dan Carpenter wrote:
> On Mon, Mar 11, 2019 at 10:14:05PM +0800, Mao Wenan wrote:
>> There is no need to have the 'T *v' variable static
>> since new value always be assigned before use it.
>>
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>> ---
>>  drivers/staging/media/davinci_vpfe/dm365_resizer.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/davinci_vpfe/dm365_resizer.c b/drivers/staging/media/davinci_vpfe/dm365_resizer.c
>> index 6098f43ac51b..a2a672d4615d 100644
>> --- a/drivers/staging/media/davinci_vpfe/dm365_resizer.c
>> +++ b/drivers/staging/media/davinci_vpfe/dm365_resizer.c
>> @@ -1881,7 +1881,7 @@ int vpfe_resizer_init(struct vpfe_resizer_device *vpfe_rsz,
>>  	struct v4l2_subdev *sd = &vpfe_rsz->crop_resizer.subdev;
>>  	struct media_pad *pads = &vpfe_rsz->crop_resizer.pads[0];
>>  	struct media_entity *me = &sd->entity;
>> -	static resource_size_t  res_len;
>> +	resource_size_t  res_len;
>                         ^
> Could you remove the extra space character also, please.

sure, I will do this, sorry, I don't pay attention to the old code style.
> 
>>  	struct resource *res;
>>  	int ret;
> 
> regards,
> dan carpenter
> 
> 
> 
> .
> 
