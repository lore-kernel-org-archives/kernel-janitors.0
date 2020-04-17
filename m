From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 17 Apr 2020 13:28:21 +0000
Subject: Re: [PATCH] RDMA/ocrdma: Fix an off-by-one issue in 'ocrdma_add_stat'
Message-Id: <8c17ed4f-fb29-4ff8-35db-afab284c6e71@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
 <20200414183441.GA28870@ziepe.ca>
In-Reply-To: <20200414183441.GA28870@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: selvin.xavier@broadcom.com, devesh.sharma@broadcom.com, dledford@redhat.com, leon@kernel.org, colin.king@canonical.com, roland@purestorage.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Le 14/04/2020 à 20:34, Jason Gunthorpe a écrit :
> On Sat, Mar 28, 2020 at 08:30:40AM +0100, Christophe JAILLET wrote:
>> There is an off-by-one issue when checking if there is enough space in the
>> output buffer, because we must keep some place for a final '\0'.
>>
>> While at it:
>>     - Use 'scnprintf' instead of 'snprintf' in order to avoid a superfluous
>>      'strlen'
>>     - avoid some useless initializations
>>     - avoida hard coded buffer size that can be computed at built time.
>>
>> Fixes: a51f06e1679e ("RDMA/ocrdma: Query controller information")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> The '\0' comes from memset(..., 0, ...) in all callers.
>> This could be also avoided if needed.
>> ---
>>   drivers/infiniband/hw/ocrdma/ocrdma_stats.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_stats.c b/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
>> index 5f831e3bdbad..614a449e6b87 100644
>> --- a/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
>> +++ b/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
>> @@ -49,13 +49,12 @@ static struct dentry *ocrdma_dbgfs_dir;
>>   static int ocrdma_add_stat(char *start, char *pcur,
>>   				char *name, u64 count)
>>   {
>> -	char buff[128] = {0};
>> -	int cpy_len = 0;
>> +	char buff[128];
>> +	int cpy_len;
>>   
>> -	snprintf(buff, 128, "%s: %llu\n", name, count);
>> -	cpy_len = strlen(buff);
>> +	cpy_len = scnprintf(buff, sizeof(buff), "%s: %llu\n", name, count);
>>   
>> -	if (pcur + cpy_len > start + OCRDMA_MAX_DBGFS_MEM) {
>> +	if (pcur + cpy_len >= start + OCRDMA_MAX_DBGFS_MEM) {
>>   		pr_err("%s: No space in stats buff\n", __func__);
>>   		return 0;
>>   	}
> The memcpy is still kind of silly right? What about this:
>
> static int ocrdma_add_stat(char *start, char *pcur, char *name, u64 count)
> {
> 	size_t len = (start + OCRDMA_MAX_DBGFS_MEM) - pcur;
> 	int cpy_len;
>
> 	cpy_len = snprintf(pcur, len, "%s: %llu\n", name, count);
> 	if (cpy_len >= len || cpy_len < 0) {
> 		pr_err("%s: No space in stats buff\n", __func__);
> 		return 0;
> 	}
> 	return cpy_len;
> }
>
> Jason

It can looks useless, but I think that the goal was to make sure that we 
would not display truncated data. Each line is either complete or absent.

I don't have any strong opinion of what is best, but I can understand 
the current logic.

This function is not a hot spot, so useless memcpy is not a big issue.

CJ
