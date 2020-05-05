From: Jia-Ju Bai <baijiaju1990@163.com>
Date: Tue, 05 May 2020 13:32:11 +0000
Subject: Re: fs: jfs: fix a possible data race in txBegin()
Message-Id: <565e317a-396e-9221-11bb-bc8c76cc9f7a@163.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5ef374a5-0e2e-5c74-a827-0148c384f6e3@web.de>
 <abbb03ec-7ce3-08b6-7d08-420743067f19@gmail.com>
 <fa6fabec-8cc5-fc62-657f-3794e9405fac@web.de>
 <df165b9f-7a51-a632-b1a0-a2cf1efa1915@oracle.com>
In-Reply-To: <df165b9f-7a51-a632-b1a0-a2cf1efa1915@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dave Kleikamp <dave.kleikamp@oracle.com>, Markus Elfring <Markus.Elfring@web.de>, Jia-Ju Bai <baijiaju1990@gmail.com>, jfs-discussion@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2020/5/5 21:23, Dave Kleikamp wrote:
> On 5/5/20 12:12 AM, Markus Elfring wrote:
>>> I am not sure how to add the tag "Fixes"...
>> How helpful do you find the available software documentation?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?idGcf1b422e6093aee2a3e55d5e162112a2c69870#n183
>>
>>
>>> I need to find which previous commit add the code about txBegin()?
>> I suggest to take another look at corresponding source code places
>> by a command like “git blame”.
>> https://git-scm.com/book/en/v2/Git-Tools-Debugging-with-Gits
> I suspect that the problem was in the code much longer than it has been
> under git source control.

I agree, because "git blame" shows the last change to txBegin() is 
commit 1da177e4c3f4, which was submitted in 2005...
And this commit just added or merged the filesystem to the Linux kernel.
Thus, adding the tag "Fixes" of this commit should be useless...


Best wishes,
Jia-Ju Bai
