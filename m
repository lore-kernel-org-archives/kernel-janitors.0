From: Jia-Ju Bai <baijiaju1990@gmail.com>
Date: Tue, 05 May 2020 13:04:09 +0000
Subject: Re: fs: jfs: fix a possible data race in txBegin()
Message-Id: <e6ec72e5-e1d8-cf15-ddfd-2e335c5de962@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5ef374a5-0e2e-5c74-a827-0148c384f6e3@web.de>
 <abbb03ec-7ce3-08b6-7d08-420743067f19@gmail.com>
 <fa6fabec-8cc5-fc62-657f-3794e9405fac@web.de>
In-Reply-To: <fa6fabec-8cc5-fc62-657f-3794e9405fac@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, jfs-discussion@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dave Kleikamp <shaggy@kernel.org>



On 2020/5/5 13:12, Markus Elfring wrote:
>> I am not sure how to add the tag "Fixes"...
> How helpful do you find the available software documentation?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?idGcf1b422e6093aee2a3e55d5e162112a2c69870#n183
>
>
>> I need to find which previous commit add the code about txBegin()?
> I suggest to take another look at corresponding source code places
> by a command like “git blame”.
> https://git-scm.com/book/en/v2/Git-Tools-Debugging-with-Gits

Thanks a lot, Markus.
I have used "git blame" to find the last change on the related source code.
I will send V2 patches, thanks again :)


Best wishes,
Jia-Ju Bai
