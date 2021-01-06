From: Chao Yu <yuchao0@huawei.com>
Date: Wed, 06 Jan 2021 01:03:08 +0000
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix null page reference in redirty_blocks
Message-Id: <6c8e6561-8a5d-010f-3d7c-8c051b4027e6@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210105041630.1393157-1-daeho43@gmail.com>
 <dba4be04-70dd-d48b-391c-1f2355591097@web.de>
In-Reply-To: <dba4be04-70dd-d48b-391c-1f2355591097@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeho Jeong <daehojeong@google.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, Markus Elfring <Markus.Elfring@web.de>, Colin Ian King <colin.king@canonical.com>, kernel-team@android.com

Daeho,

FYI

https://www.spinics.net/lists/kernel/msg3595944.html

On 2021/1/5 20:04, Markus Elfring wrote:
>> Fixed null page reference when find_lock_page() fails in
>> redirty_blocks().
> 
> I suggest to choose an other imperative wording for this change description.
> 
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id6bbbd0e234d817938bdc52121a0f5473b3e58f5#n89
> 
> 
>> v2: changed error value and break the loop when error occurs
> 
> I propose to use a return statement instead of a break in the second if branch
> for this function implementation.
> 
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id6bbbd0e234d817938bdc52121a0f5473b3e58f5#n481
> 
> Regards,
> Markus
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 
