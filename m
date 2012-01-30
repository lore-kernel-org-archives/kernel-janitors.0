From: Boaz Harrosh <bharrosh@panasas.com>
Date: Mon, 30 Jan 2012 13:50:05 +0000
Subject: Re: [patch] exofs: add a cap on the memcpy() size
Message-Id: <4F26A00D.7000105@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120130075949.GA22364@elgon.mountain>
In-Reply-To: <20120130075949.GA22364@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 01/30/2012 03:44 PM, Dan Carpenter wrote:
> On Mon, Jan 30, 2012 at 03:37:29PM +0200, Boaz Harrosh wrote:
>> I think I'd like something like:
>> -  	memcpy(odi->systemid, dt_dev->systemid, odi->systemid_len);
>> +	if (likely(odi->systemid_len))
>> + 		memcpy(odi->systemid, dt_dev->systemid, OSD_SYSTEMID_LEN);
>>
>> Which should also make the static checkers happy. What do you think?
>>
> 
> Sounds good to me.
> 
> regards,
> dan carpenter
> 

OK I'll make a patch. Please send your review-by

Thanks for catching it
Boaz

