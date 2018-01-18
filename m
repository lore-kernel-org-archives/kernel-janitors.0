From: walter harms <wharms@bfs.de>
Date: Thu, 18 Jan 2018 11:20:26 +0000
Subject: Re: [PATCH] platform/x86: dell-smbios: Fix error handling in build_tokens_sysfs()
Message-Id: <5A6082FA.1040608@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180118104503.GA30055@mwanda> <5A607BF6.6090800@bfs.de> <20180118110334.v33ypxsavbmq6qpu@mwanda>
In-Reply-To: <20180118110334.v33ypxsavbmq6qpu@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org



Am 18.01.2018 12:03, schrieb Dan Carpenter:
> On Thu, Jan 18, 2018 at 11:50:30AM +0100, walter harms wrote:
>>> @@ -523,7 +523,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
>>>  	return 0;
>>>  
>>>  out_unwind_strings:
>>> -	for (i = i-1; i > 0; i--) {
>>> +	for (i = i-1; i >= 0; i--) {
>>>  		kfree(token_location_attrs[i].attr.name);
>>>  		kfree(token_value_attrs[i].attr.name);
>>>  	}
>>
>> would you mind to reverse order here ?
>> you know programmers are terrible at couting backwards.
> 
> I prefer to always unwind in reverse order so I'd prefer to leave it
> as-is.


It is just a comment from my side. we can leave the actual decision to the
current maintainer.

re,
 wh

> 
> regards,
> dan carpenter
> 
> 
