From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 28 Jan 2021 14:55:44 +0000
Subject: Re: [PATCH][next] Input: iqs5xx: Ensure error_bl is initialized on error exit path
Message-Id: <b5dc0706-1933-fd2b-5dfc-49fb4aed38f1@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128121903.636652-1-colin.king@canonical.com>
 <20210128143946.GA14625@labundy.com>
In-Reply-To: <20210128143946.GA14625@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff LaBundy <jeff@labundy.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 28/01/2021 14:39, Jeff LaBundy wrote:
> Hi Colin,
> 
> On Thu, Jan 28, 2021 at 12:19:03PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently if the call to qs5xx_fw_file_parse fails the error return
>> exit path will read the uninitialized variable error_bl. Fix this
>> by ensuring error_bl is initialized to zero.
>>
>> Addresses-Coverity: ("Uninitialized scalar variable")
>> Fixes: 2539da6677b6 ("Input: iqs5xx - preserve bootloader errors")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> This was fixed in [1]; it just needs pushed.

OK, thanks for letting me know.
> 
> [1] https://patchwork.kernel.org/patch/12043701
> 
>> ---
>>  drivers/input/touchscreen/iqs5xx.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
>> index 05e0c6ff217b..54f30038dca4 100644
>> --- a/drivers/input/touchscreen/iqs5xx.c
>> +++ b/drivers/input/touchscreen/iqs5xx.c
>> @@ -852,7 +852,7 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
>>  static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
>>  {
>>  	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
>> -	int error, error_bl;
>> +	int error, error_bl = 0;
>>  	u8 *pmap;
>>  
>>  	if (iqs5xx->bl_status = IQS5XX_BL_STATUS_NONE)
>> -- 
>> 2.29.2
>>
> 
> Kind regards,
> Jeff LaBundy
> 
