From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 03 Apr 2017 09:44:49 +0000
Subject: Re: [PATCH] wlcore: fix spelling mistake in wl1271_warning 'iligal' -> 'illegal'
Message-Id: <6473739f-5f3e-c32c-dad7-22b6c15d98cc@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403091530.18564-1-colin.king@canonical.com>
 <1491211256.27353.58.camel@perches.com>
In-Reply-To: <1491211256.27353.58.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/04/17 10:20, Joe Perches wrote:
> On Mon, 2017-04-03 at 10:15 +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> trivial fix to spelling mistake in wl1271_warning error message
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/net/wireless/ti/wlcore/debugfs.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ti/wlcore/debugfs.c b/drivers/net/wireless/ti/wlcore/debugfs.c
>> index 58e148d7bc7b..416080adc181 100644
>> --- a/drivers/net/wireless/ti/wlcore/debugfs.c
>> +++ b/drivers/net/wireless/ti/wlcore/debugfs.c
>> @@ -1249,7 +1249,7 @@ static ssize_t fw_logger_write(struct file *file,
>>  	}
>>  
>>  	if (wl->conf.fwlog.output = 0) {
>> -		wl1271_warning("iligal opperation - fw logger disabled by default, please change mode via wlconf");
>> +		wl1271_warning("illegal opperation - fw logger disabled by default, please change mode via wlconf");
> 
> Hi Colin.
> 
> When you do these would you please fix all the typos on the
> same line?  opperation -> operation

Sure, I stupidly missed that.

> 
> Also, generally, invalid is a better word choice than illegal
> for these situations.

Good point.
> 
> Thanks and cheers, Joe
> 

