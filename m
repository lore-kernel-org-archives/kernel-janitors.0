From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 04 May 2020 16:33:40 +0000
Subject: Re: [PATCH] fs: jfs: fix a possible data race in metapage_writepage()
Message-Id: <bcfeb785-b787-4ebe-c1e1-159b6efc7e51@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5ef374a5-0e2e-5c74-a827-0148c384f6e3@web.de>
In-Reply-To: <5ef374a5-0e2e-5c74-a827-0148c384f6e3@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jia-Ju Bai <baijiaju1990@gmail.com>, jfs-discussion@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dave Kleikamp <shaggy@kernel.org>

…
> To fix this data race, the spinlock mp->log->gclock is used in
> metapage_writepage().
>
> This data race is found by our concurrency fuzzer.

How do you think about a wording variant like the following?

   Change description:
   …
   This data race was found by our concurrency fuzzer.

   Thus use the spin lock “mp->log->gclock” for the assignment of
   the data structure member “log->cflag” to a local variable
   in this function implementation.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
