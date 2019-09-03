From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 15:00:46 +0000
Subject: Re: gfs2: Delete an unnecessary check before brelse()
Message-Id: <5e7b4313-c3e9-c3c8-8823-7c7a62a13fff@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9250af4a-993c-e86e-678c-acbd59b0861a@web.de>
 <CAHpGcMKEFaZBRNnt1edrvBMS6VUXs5hMdQ2BdNBE3ssgkmDoww@mail.gmail.com>
In-Reply-To: <CAHpGcMKEFaZBRNnt1edrvBMS6VUXs5hMdQ2BdNBE3ssgkmDoww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?Andreas_Gr=c3=bcnbacher?= <andreas.gruenbacher@gmail.com>, cluster-devel <cluster-devel@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, Bob Peterson <rpeterso@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> The brelse() function tests whether its argument is NULL
>> and then returns immediately.
>> Thus the test around the call is not needed.
>>
>> This issue was detected by using the Coccinelle software.
>
> The same applies to brelse() in gfs2_dir_no_add
> (which Coccinelle apparently missed),

Would you like to achieve that such source code analysis
will be extended to corresponding header files?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/gfs2/dir.h?id=7dc4585e03786f84d6e9dc16caa3ba5b8b44d986#n33


> so let me fix that as well.

Thanks for your positive feedback.

Regards,
Markus
