From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 10 Jun 2020 18:56:26 +0000
Subject: Re: [PATCH v2] exfat: add missing brelse() calls on error paths
Message-Id: <b44caf20-d3fc-30ac-f716-2375ed55dc9a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610172213.GA90634@mwanda>
 <740ce77a-5404-102b-832f-870cbec82d56@web.de> <20200610184517.GC4282@kadam>
In-Reply-To: <20200610184517.GC4282@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Tetsuhiro Kohada <kohada.t2@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>

>>> If the second exfat_get_dentry() call fails then we need to release
>>> "old_bh" before returning.  There is a similar bug in exfat_move_file().
>>
>> Would you like to convert any information from this change description
>> into an imperative wording?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=5b14671be58d0084e7e2d1cc9c2c36a94467f6e0#n151
>
> I really feel like imperative doesn't add anything.  I understand that
> some people feel really strongly about it, but I don't know why.  It
> doesn't make commit messages more understandable.

Do you insist to deviate from the given guideline?


> The important thing is that the problem is clear, the fix is clear and
> the runtime impact is clear.

I have got further ideas to improve also this commit message.
I am curious if other contributors would like to add another bit of
patch review.

Regards,
Markus
