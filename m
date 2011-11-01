From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Tue, 01 Nov 2011 12:53:18 +0000
Subject: Re: [patch] edac: sb_edac: add sanity check to silence static checker
Message-Id: <4EAFEBBE.3070604@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111101062852.GA19020@elgon.mountain> <4EAFE6DF.8030403@bfs.de>
In-Reply-To: <4EAFE6DF.8030403@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "Mark A. Grondona" <mgrondona@llnl.gov>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Em 01-11-2011 10:32, walter harms escreveu:
> 
> 
> Am 01.11.2011 07:28, schrieb Dan Carpenter:
>> I assume the the check on if (limit <= prv) prevents n_tads from
>> actually reaching MAX_TAD.  The problem with that is that it relies
>> on the hardware returning the right value and Smatch complains that
>> if it doesn't we could have a buffer overflow.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> Feel free to ignore this patch if you want.  I don't have very stong
>> feelings about this either way.
>>
>> diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
>> index 7a402bf..ebf386c 100644
>> --- a/drivers/edac/sb_edac.c
>> +++ b/drivers/edac/sb_edac.c
>> @@ -970,6 +970,12 @@ static int get_memory_error_data(struct mem_ctl_info *mci,
>>  			break;
>>  		prv = limit;
>>  	}
>> +	if (n_tads = MAX_TAD) {
>> +		sprintf(msg, "Could not discover the memory channel");
> 
> why the sprintf() ? can you not simply:
> 	edac_mc_handle_ce_no_info(mci,"Could not discover the memory channel");

Yes, please us the edac-specific call. I'm working on some patches that will
provide an additional functionality to those edac report calls. So, using
sprintf() won't do the right thing after applying those patches (likely for
Kernel v3.3).

> 		
> 	re,
>  	 wh
>> +		edac_mc_handle_ce_no_info(mci, msg);
>> +		return -EINVAL;
>> +	}
>> +
>>  	ch_way = TAD_CH(reg) + 1;
>>  	sck_way = TAD_SOCK(reg) + 1;
>>  	/*

