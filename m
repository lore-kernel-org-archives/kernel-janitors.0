From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 11 Apr 2019 12:23:49 +0000
Subject: Re: [PATCH -next] memstick: remove set but not used variable 'data'
Message-Id: <df3b6949-a54e-c887-742d-94cecbb7f5d4@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190411025904.188152-1-yuehaibing@huawei.com>
 <CAPDyKFq8icX27w2FaLgTWtdV1MicfVO+rG_5sZT9n-5pT7iAWg@mail.gmail.com>
In-Reply-To: <CAPDyKFq8icX27w2FaLgTWtdV1MicfVO+rG_5sZT9n-5pT7iAWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Will Deacon <will.deacon@arm.com>, Jens Axboe <axboe@kernel.dk>, Omar Sandoval <osandov@fb.com>, Hannes Reinecke <hare@suse.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 2019/4/11 19:01, Ulf Hansson wrote:
> On Thu, 11 Apr 2019 at 04:48, YueHaibing <yuehaibing@huawei.com> wrote:
>>
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> drivers/memstick/host/jmb38x_ms.c: In function 'jmb38x_ms_issue_cmd':
>> drivers/memstick/host/jmb38x_ms.c:371:17: warning:
>>  variable 'data' set but not used [-Wunused-but-set-variable]
>>
>> It's never used since introduction and can be removed.
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> Applied for next (to my mmc tree), thanks!
> 
> Next time, please post to linux-mmc as well.

Ok, Thanks!

> 
> Kind regards
> Uffe
> 
> 
>> ---
>>  drivers/memstick/host/jmb38x_ms.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
>> index e3a5af65dbce..acec09813419 100644
>> --- a/drivers/memstick/host/jmb38x_ms.c
>> +++ b/drivers/memstick/host/jmb38x_ms.c
>> @@ -368,7 +368,6 @@ static int jmb38x_ms_transfer_data(struct jmb38x_ms_host *host)
>>  static int jmb38x_ms_issue_cmd(struct memstick_host *msh)
>>  {
>>         struct jmb38x_ms_host *host = memstick_priv(msh);
>> -       unsigned char *data;
>>         unsigned int data_len, cmd, t_val;
>>
>>         if (!(STATUS_HAS_MEDIA & readl(host->addr + STATUS))) {
>> @@ -400,8 +399,6 @@ static int jmb38x_ms_issue_cmd(struct memstick_host *msh)
>>                         cmd |= TPC_WAIT_INT;
>>         }
>>
>> -       data = host->req->data;
>> -
>>         if (!no_dma)
>>                 host->cmd_flags |= DMA_DATA;
>>
>>
>>
> 
> .
> 
