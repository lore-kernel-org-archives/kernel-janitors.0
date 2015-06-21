From: walter harms <wharms@bfs.de>
Date: Sun, 21 Jun 2015 11:58:16 +0000
Subject: Re: [PATCH 09/12] staging: lustre: obdclass: Use !x to check for kzalloc failure
Message-Id: <5586A6D8.7040500@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434819550-3193-10-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 21.06.2015 12:29, schrieb Julia Lawall:
>>> @@ -885,7 +885,7 @@ static int lmd_parse_mgssec(struct lustr
>>>  		length = tail - ptr;
>>>  
>>>  	lmd->lmd_mgssec = kzalloc(length + 1, GFP_NOFS);
>>> -	if (lmd->lmd_mgssec = NULL)
>>> +	if (!lmd->lmd_mgssec)
>>>  		return -ENOMEM;
>>>  
>>>  	memcpy(lmd->lmd_mgssec, ptr, length);
>> looks like memdup()
> 
> kmemdup has the same length for both calls.  There is kstrndup, but it
> recalculates the length, which looks unnecessary here.
> 
> julia
> 

mmh, it seem to be use only while mount,
i am wonderingparsing a comma sperareted list must be commen problem for
all FS (and others) maybe i am looking in thew wrong place, there should be
some helpers available ? are they ?

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
