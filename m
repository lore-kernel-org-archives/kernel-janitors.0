From: Paul Moore <paul@paul-moore.com>
Date: Fri, 31 Mar 2017 19:18:09 +0000
Subject: Re: [PATCH] selinux: Fix an uninitialized variable bug
Message-Id: <CAHC9VhT7njoVyHgyiTQhCcvZEYrTE_XZRLxT4+JJPiH3W88AUw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170331152118.GA8141@mwanda>
	<1490975541.31110.12.camel@tycho.nsa.gov>
In-Reply-To: <1490975541.31110.12.camel@tycho.nsa.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On Fri, Mar 31, 2017 at 11:52 AM, Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On Fri, 2017-03-31 at 18:21 +0300, Dan Carpenter wrote:
>> We removed this initialization as a cleanup but it is probably
>> required.
>>
>> The concern is that "nel" can be zero.  I'm not an expert on SELinux
>> code but I think it looks possible to write an SELinux policy which
>> triggers this bug.  GCC doesn't catch this, but my static checker
>> does.
>>
>> Fixes: 9c312e79d6af ("selinux: Delete an unnecessary variable
>> initialisation in range_read()")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Nice catch, thanks!
>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>

Yes, indeed.  Thanks Dan, I should have caught this when merging Markus' patch.

Merged.

>> diff --git a/security/selinux/ss/policydb.c
>> b/security/selinux/ss/policydb.c
>> index 658247f98dc1..0080122760ad 100644
>> --- a/security/selinux/ss/policydb.c
>> +++ b/security/selinux/ss/policydb.c
>> @@ -1832,7 +1832,7 @@ u32 string_to_av_perm(struct policydb *p, u16
>> tclass, const char *name)
>>
>>  static int range_read(struct policydb *p, void *fp)
>>  {
>> -     struct range_trans *rt;
>> +     struct range_trans *rt = NULL;
>>       struct mls_range *r = NULL;
>>       int i, rc;
>>       __le32 buf[2];

-- 
paul moore
www.paul-moore.com
