From: walter harms <wharms@bfs.de>
Date: Thu, 26 Jan 2017 13:02:44 +0000
Subject: Re: [patch net-next] smc: some potential use after free bugs
Message-Id: <5889F374.9040600@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170126090527.GA966@mwanda>
In-Reply-To: <20170126090527.GA966@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 26.01.2017 12:23, schrieb Ursula Braun:
> 
> On 01/26/2017 10:05 AM, Dan Carpenter wrote:
>> Say we got really unlucky and these failed on the last iteration, then
>> it could lead to a use after free bug.
> thanks for reporting this! I had already a similar patch prepared, but not
> yet submitted. It contains all your added lines plus these additional
> pre-initializations at definition time:
> 
> @@ -509,7 +509,7 @@ int smc_sndbuf_create(struct smc_sock *smc)
>         struct smc_connection *conn = &smc->conn;
>         struct smc_link_group *lgr = conn->lgr;
>         int tmp_bufsize, tmp_bufsize_short;
> -   struct smc_buf_desc *sndbuf_desc;
> + struct smc_buf_desc *sndbuf_desc = NULL;
>         int rc;
>  
>         /* use socket send buffer size (w/o overhead) as start value */
> 
> @@ -573,7 +575,7 @@ int smc_rmb_create(struct smc_sock *smc)
>         struct smc_connection *conn = &smc->conn;
>         struct smc_link_group *lgr = conn->lgr;
>         int tmp_bufsize, tmp_bufsize_short;
> -   struct smc_buf_desc *rmb_desc;
> + struct smc_buf_desc *rmb_desc = NULL;
>         int rc;
>  
>         /* use socket recv buffer size (w/o overhead) as start value */
> 
> If you do not contradict, I will post my enhanced patch version.


Independend of that ...

would it be possible to make sndbuf_desc->cpu_addr a zero size array
and then simply do a:
sndbuf_desc = kzalloc(sizeof(*sndbuf_desc)+tmp_bufsize, GFP_KERNEL);

(read also: is the whole list of __GPF* really needed ?)

that would make the memhandling more easy

re,
 wh

>>
>> Fixes: cd6851f30386 ("smc: remote memory buffers (RMBs)")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
>> index 8b1d34378829..941279e1504e 100644
>> --- a/net/smc/smc_core.c
>> +++ b/net/smc/smc_core.c
>> @@ -535,6 +535,7 @@ int smc_sndbuf_create(struct smc_sock *smc)
>>  			/* if send buffer allocation has failed,
>>  			 * try a smaller one
>>  			 */
>> +			sndbuf_desc = NULL;
>>  			continue;
>>  		}
>>  		rc = smc_ib_buf_map(lgr->lnk[SMC_SINGLE_LINK].smcibdev,
>> @@ -543,6 +544,7 @@ int smc_sndbuf_create(struct smc_sock *smc)
>>  		if (rc) {
>>  			kfree(sndbuf_desc->cpu_addr);
>>  			kfree(sndbuf_desc);
>> +			sndbuf_desc = NULL;
>>  			continue; /* if mapping failed, try smaller one */
>>  		}
>>  		sndbuf_desc->used = 1;
>> @@ -599,6 +601,7 @@ int smc_rmb_create(struct smc_sock *smc)
>>  			/* if RMB allocation has failed,
>>  			 * try a smaller one
>>  			 */
>> +			rmb_desc = NULL;
>>  			continue;
>>  		}
>>  		rc = smc_ib_buf_map(lgr->lnk[SMC_SINGLE_LINK].smcibdev,
>> @@ -607,6 +610,7 @@ int smc_rmb_create(struct smc_sock *smc)
>>  		if (rc) {
>>  			kfree(rmb_desc->cpu_addr);
>>  			kfree(rmb_desc);
>> +			rmb_desc = NULL;
>>  			continue; /* if mapping failed, try smaller one */
>>  		}
>>  		rc = smc_ib_get_memory_region(lgr->lnk[SMC_SINGLE_LINK].roce_pd,
>> @@ -619,6 +623,7 @@ int smc_rmb_create(struct smc_sock *smc)
>>  					 DMA_FROM_DEVICE);
>>  			kfree(rmb_desc->cpu_addr);
>>  			kfree(rmb_desc);
>> +			rmb_desc = NULL;
>>  			continue;
>>  		}
>>  		rmb_desc->used = 1;
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
