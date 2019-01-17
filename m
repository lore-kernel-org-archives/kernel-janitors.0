From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 17 Jan 2019 14:56:23 +0000
Subject: Re: [PATCH] cw1200: fix indentation issues
Message-Id: <1fa8b078-1db9-d109-e8e5-f05dc0e48fd6@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190117143623.29363-1-colin.king@canonical.com>
 <87sgxrpc6q.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87sgxrpc6q.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Solomon Peachy <pizza@shaftnet.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 17/01/2019 14:54, Kalle Valo wrote:
> Colin King <colin.king@canonical.com> writes:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There are two lines that have indentation issues, fix these.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/net/wireless/st/cw1200/fwio.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/st/cw1200/fwio.c b/drivers/net/wireless/st/cw1200/fwio.c
>> index 30e7646d04af..b7881232499c 100644
>> --- a/drivers/net/wireless/st/cw1200/fwio.c
>> +++ b/drivers/net/wireless/st/cw1200/fwio.c
>> @@ -465,8 +465,8 @@ int cw1200_load_firmware(struct cw1200_common *priv)
>>  
>>  	if (!(val32 & ST90TDS_CONFIG_ACCESS_MODE_BIT)) {
>>  		pr_err("Device is already in QUEUE mode!\n");
>> -			ret = -EINVAL;
>> -			goto out;
>> +		ret = -EINVAL;
>> +		goto out;
> 
> Just out of curiosity, how do you find these?
> 
smatch, grep for "warn: inconsistent indenting"

Colin
