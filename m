From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Jan 2017 10:00:15 +0000
Subject: Re: [PATCH 1/5] blk-throttle: Move three assignments for the variable "ret" in tg_set_max()
Message-Id: <130ce081-e9a2-4744-c74b-b73bea5ae98c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e734cafa-eec0-9d5b-b368-2de496a96c80@users.sourceforge.net>
 <75495d45-cfc4-9740-39e4-bd4c3e71232b@users.sourceforge.net>
 <20170123091510.GA3517@linux-x5ow.site>
In-Reply-To: <20170123091510.GA3517@linux-x5ow.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Thumshirn <jthumshirn@suse.de>, linux-block@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> @@ -1327,27 +1327,30 @@ static ssize_t tg_set_max(struct kernfs_open_file *of,
>>  			break;
>>  		ctx.body += len;
>>  
>> -		ret = -EINVAL;
>>  		p = tok;
>>  		strsep(&p, "=");
>> -		if (!p || (sscanf(p, "%llu", &val) != 1 && strcmp(p, "max")))
>> +		if (!p || (sscanf(p, "%llu", &val) != 1 && strcmp(p, "max"))) {
>> +			ret = -EINVAL;
>>  			goto out_finish;
>> +		}
> 
> Sorry, I don't like this patch. We know the next error if we encounter one
> will be EINVAL until we change it.

Thanks for your constructive feedback.


> Your patch doesn't introduce a functual change and doesn't improve readability,
> so I don't really see a point for it.

We have got different preferences for the placement of error code settings.
Do you care about run time changes there?

Regards,
Markus
