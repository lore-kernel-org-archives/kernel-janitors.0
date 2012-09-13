From: Rusty Russell <rusty@rustcorp.com.au>
Date: Thu, 13 Sep 2012 06:43:24 +0000
Subject: Re: [PATCH] module: report -EFAULT on bytes remaining
Message-Id: <87pq5qsabn.fsf@rustcorp.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912150616.GA27343@www.outflux.net> <20120912154023.GL19410@mwanda>
In-Reply-To: <20120912154023.GL19410@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>, kernel-janitors@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Wed, Sep 12, 2012 at 08:06:16AM -0700, Kees Cook wrote:
>> Caught by smatch:
>> kernel/module.c:2450 copy_module_from_user() warn: maybe return -EFAULT instead of the bytes remaining?  
>> 
>> Clean up the copy_from_user() call to not report a positive value.
>> With this patch, init_module() will report errors from copy_from_user
>> (before it would always only report -EFAULT when err != 0).
>> 
>> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>> This change is on top of the finit_module patch series.
>> ---
>>  kernel/module.c |    5 ++++-
>>  1 files changed, 4 insertions(+), 1 deletions(-)
>> 
>> diff --git a/kernel/module.c b/kernel/module.c
>> index 0ad03c4..05b8dde 100644
>> --- a/kernel/module.c
>> +++ b/kernel/module.c
>> @@ -2441,8 +2441,11 @@ int copy_module_from_user(const void __user *umod, unsigned long len,
>>  		return -ENOMEM;
>>  
>>  	err = copy_from_user(info->hdr, umod, info->len);
>> -	if (err)
>> +	if (err) {
>> +		if (err > 0)
>                 ^^^^^^^^^^^
> This condition is always true because copy_to/from_user() returns
> the number of bytes remaining to be copied.  (It never returns a
> negative error code).

Yes, I made the obvious fix (eliminating the >0 check).

This "copy_from_user is stupid" was a debate a lost long ago, but it
still annoys me.

Applied,
Rusty.
