From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 07 Aug 2019 12:42:57 +0000
Subject: Re: [PATCH][ocfs2-next] ocfs2: ensure ret is set to zero before returning
Message-Id: <bf4d059a-94fc-d8cf-78c7-8606644185a5@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190807121929.28918-1-colin.king@canonical.com>
 <fb3d7441-93ea-b619-52fc-00da950c9201@gmail.com>
In-Reply-To: <fb3d7441-93ea-b619-52fc-00da950c9201@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joseph Qi <jiangqi903@gmail.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/08/2019 13:35, Joseph Qi wrote:
> 
> 
> On 19/8/7 20:19, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> A previous commit introduced a regression where variable ret was
>> originally being set from the return from a call to function
>> dlm_create_debugfs_subroot and this set was removed. Currently
>> ret is now uninitialized if no alloction errors are found which
>> may end up with a bogus check on ret < 0 on the 'leave:' return
>> path.  Fix this by setting ret to zero on a successful execution
>> path.
> 
> Good catch.
> Or shall we just initialize 'ret' at first?

Initialized ret first may not catch subsequent coding errors where error
returns paths have not initialized ret, so my preference is when it is
required and not before.

> 
>>
>> Addresses-Coverity: ("Uninitialzed scalar variable")

Can this be fixed up when applied rather sending a V2?
> 
> Typo here. 
> 
> Thanks,
> Joseph
> 
>> Fixes: cba322160ef0 ("ocfs2: further debugfs cleanups")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  fs/ocfs2/dlm/dlmdomain.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/ocfs2/dlm/dlmdomain.c b/fs/ocfs2/dlm/dlmdomain.c
>> index 5c4218d66dd2..ee6f459f9770 100644
>> --- a/fs/ocfs2/dlm/dlmdomain.c
>> +++ b/fs/ocfs2/dlm/dlmdomain.c
>> @@ -2052,6 +2052,7 @@ static struct dlm_ctxt *dlm_alloc_ctxt(const char *domain,
>>  	mlog(0, "context init: refcount %u\n",
>>  		  kref_read(&dlm->dlm_refs));
>>  
>> +	ret = 0;
>>  leave:
>>  	if (ret < 0 && dlm) {
>>  		if (dlm->master_hash)
>>
