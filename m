From: Jia-Ju Bai <baijiaju1990@gmail.com>
Date: Tue, 05 May 2020 04:10:20 +0000
Subject: Re: [PATCH] fs: jfs: fix a possible data race in txBegin()
Message-Id: <abbb03ec-7ce3-08b6-7d08-420743067f19@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5ef374a5-0e2e-5c74-a827-0148c384f6e3@web.de>
In-Reply-To: <5ef374a5-0e2e-5c74-a827-0148c384f6e3@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, jfs-discussion@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dave Kleikamp <shaggy@kernel.org>



On 2020/5/5 0:15, Markus Elfring wrote:
>> Thus, a data race can occur for tblk->flag.
>>
>> To fix this data race, the spinlock log->gclock is used in
>> txBegin().
>>
>> This data race is found by our concurrency fuzzer.
> How do you think about a wording variant like the following?
>
>     Change description:
>     A data race can occur for the data structure member “flag”.
>     This data race was found by our concurrency fuzzer.
>
>     Thus use the spin lock “gclock” for the resetting of five
>     data structure members in this function implementation.
>
>
> Would you like to add the tag “Fixes” to the commit message?
>

Thanks, Markus.
I am not sure how to add the tag "Fixes"...
I need to find which previous commit add the code about txBegin()?


Best wishes,
Jia-Ju Bai
