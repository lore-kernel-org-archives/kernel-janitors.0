From: Giacomo Picchiarelli <gpicchiarelli@gmail.com>
Date: Thu, 18 Jun 2020 16:45:15 +0000
Subject: Re: [help][coccinelle] coccicheck failed
Message-Id: <b4e2ddf9-1f58-025d-3583-cef8d994bb1c@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
In-Reply-To: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

make coccicheck MODE=patch DEBUG_FILE=cocci3.err

result:

/usr/local/bin/spatch -D patch --very-quiet --cocci-file ./scripts/coccinelle/api/alloc/alloc_cast.cocci --no-includes --include-headers --dir . -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include -I ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./include/uapi -I ./include/generated/uapi --include ./include/linux/kconfig.h --jobs 8 --chunksize 1

Python error: No module named coccilib.elems

Suggestions? Missing something?


On 18/06/20 17:23, Julia Lawall wrote:
>
> On Thu, 18 Jun 2020, Giacomo Picchiarelli wrote:
>
>> Newbie here. I couldn't try the patch attached.
> Hi,
>
> I'm not sure what you are trying to do.  The patch attached is a real
> patch, not a Coccinelle semantic patch.
>
>> I'm using coccinelle (spatch version 1.0.4 with Python support and with PCRE support),
>> I'm having issues with the following command:
>>
>> make coccicheck MODE=patch
>>
>> "./tools/testing/selftests/net/hwtstamp_config.c:74:45-46: WARNING: Use ARRAY_SIZE
>>
>> 807 811
>>
>> coccicheck failed"
> Randy's suggestion about DEBUG is good.  You can also get a more modern
> version of Coccinelle from github.
>
> julia

Hi Julia,
I'm actually having some issues with coccinelle compilation, I'm going to try with the newest version as soon as possible.
Thanks.

>
>
>> Applied to: commit 1b5044021070efa3259f3e9548dc35d1eb6aa844 (HEAD -> master, origin/master, origin/HEAD)
>> Merge: 69119673bd50 dbed452a078d
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Wed Jun 17 11:29:37 2020 -0700
>>
>> Suggestions?
>>
>> --
>> Giacomo Picchiarelli <gpicchiarelli@gmail.com>
>> GPG Key: 2E51 2591 F3E8 7CDC F504  140F 8559 3ACF 4691 ACC0
>>
>>
-- 
Giacomo Picchiarelli <gpicchiarelli@gmail.com>
GPG Key: 2E51 2591 F3E8 7CDC F504  140F 8559 3ACF 4691 ACC0
