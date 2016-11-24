From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 24 Nov 2016 12:31:11 +0000
Subject: Re: [PATCH] orangefs: Axe some dead code
Message-Id: <CAOg9mSRZ8VLGPD876DPq1iLFofwPExWb-rzvieoiP+kQJZiJeQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161121221702.6438-1-christophe.jaillet@wanadoo.fr> <alpine.BSO.2.20.1611221048250.48648@x220.mkb.name>
In-Reply-To: <alpine.BSO.2.20.1611221048250.48648@x220.mkb.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Brandenburg <martin@omnibond.com>, Mike Marshall <hubcap@omnibond.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

This seems like a good and proper patch to me, and simple too.
But like all changes, it needs tested. While I was testing it, I
discovered a regression in the associated userspace code. I
"bisected" (we use SVN for the userspace part of Orangefs)
down to the commit that caused the regression, and some
of the userspace folks are going to fix it.

I don't think I should ask Linus to pull this patch until I can
test it. Since we're about to go into rc7, it might not go in
until the next go around...

-Mike

On Tue, Nov 22, 2016 at 10:49 AM, Martin Brandenburg
<martin@omnibond.com> wrote:
> On Mon, 21 Nov 2016, Christophe JAILLET wrote:
>
>> The "perf_counter_reset" case has already been handled above.
>> Moreover "ORANGEFS_PARAM_REQUEST_OP_READAHEAD_COUNT_SIZE" is not a really
>> consistent.
>> It is likely that this (dead) code is a cut and paste left over.
>
> That's exactly what this is.
>
> Reviewed-by: Martin Brandenburg <martin@omnibond.com>
>
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>  fs/orangefs/orangefs-sysfs.c | 9 ---------
>>  1 file changed, 9 deletions(-)
>>
>> diff --git a/fs/orangefs/orangefs-sysfs.c b/fs/orangefs/orangefs-sysfs.c
>> index a799546a67f7..084954448f18 100644
>> --- a/fs/orangefs/orangefs-sysfs.c
>> +++ b/fs/orangefs/orangefs-sysfs.c
>> @@ -609,15 +609,6 @@ static ssize_t sysfs_service_op_store(struct kobject *kobj,
>>                       new_op->upcall.req.param.u.value32[0] = val1;
>>                       new_op->upcall.req.param.u.value32[1] = val2;
>>                       goto value_set;
>> -             } else if (!strcmp(attr->attr.name,
>> -                                "perf_counter_reset")) {
>> -                     if ((val > 0)) {
>> -                             new_op->upcall.req.param.op >> -                             ORANGEFS_PARAM_REQUEST_OP_READAHEAD_COUNT_SIZE;
>> -                     } else {
>> -                             rc = 0;
>> -                             goto out;
>> -                     }
>>               }
>>
>>       } else if (!strcmp(kobj->name, ACACHE_KOBJ_ID)) {
>> --
>> 2.9.3
>>
>>
