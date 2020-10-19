From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 19 Oct 2020 17:52:09 +0000
Subject: Re: [PATCH] staging: wfx: make a const array static, makes object smaller
Message-Id: <18f2f9d4-5199-d6d0-f4f5-c17d609a44a7@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201016223303.687278-1-colin.king@canonical.com>
 <09cd7e609324d460afdf14829baf3c2f1a9cb9cd.camel@perches.com>
In-Reply-To: <09cd7e609324d460afdf14829baf3c2f1a9cb9cd.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, Colin King <colin.king@canonical.com>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Le 17/10/2020 à 02:11, Joe Perches a écrit :
> On Fri, 2020-10-16 at 23:33 +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Don't populate const array filter_ies on the stack but instead
>> make it static. Makes the object code smaller by 261 bytes.
>>
>> Before:
>>     text	   data	    bss	    dec	    hex	filename
>>    21674	   3166	    448	  25288	   62c8	drivers/staging/wfx/sta.o
>>
>> After:
>>     text	   data	    bss	    dec	    hex	filename
>>    21349	   3230	    448	  25027	   61c3	drivers/staging/wfx/sta.o
> 
> Thanks.
> 
> It's odd to me it's so large a change as it's only
> 24 bytes of initialization. (3 entries, each 8 bytes)
> 

The function looks small.
Maybe it is inlined by gcc in each of the 3 callers?

CJ

> This line in the same function:
> 
> 		hif_set_beacon_filter_table(wvif, 3, filter_ies);
> 
> might as well use ARRAY_SIZE(filter_ies) instead of 3
> 
> 
> 
