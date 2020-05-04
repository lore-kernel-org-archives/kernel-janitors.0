From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 04 May 2020 16:15:48 +0000
Subject: Re: [PATCH] fs: jfs: fix a possible data race in txBegin()
Message-Id: <5ef374a5-0e2e-5c74-a827-0148c384f6e3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jia-Ju Bai <baijiaju1990@gmail.com>, jfs-discussion@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dave Kleikamp <shaggy@kernel.org>

> Thus, a data race can occur for tblk->flag.
>
> To fix this data race, the spinlock log->gclock is used in
> txBegin().
>
> This data race is found by our concurrency fuzzer.

How do you think about a wording variant like the following?

   Change description:
   A data race can occur for the data structure member “flag”.
   This data race was found by our concurrency fuzzer.

   Thus use the spin lock “gclock” for the resetting of five
   data structure members in this function implementation.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
