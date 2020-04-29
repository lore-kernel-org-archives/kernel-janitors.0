From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 29 Apr 2020 01:03:13 +0000
Subject: Re: [PATCH -next] NFSv4: Use GFP_ATOMIC under spin lock in _pnfs_grab_empty_layout()
Message-Id: <8564645e-124c-ef53-3cd8-1d887dfe867e@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428071932.69976-1-weiyongjun1@huawei.com>
 <20200428180448.GJ2014@kadam>
In-Reply-To: <20200428180448.GJ2014@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2020/4/29 2:04, Dan Carpenter wrote:
> On Tue, Apr 28, 2020 at 07:19:32AM +0000, Wei Yongjun wrote:
>> A spin lock is taken here so we should use GFP_ATOMIC.
>>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  fs/nfs/pnfs.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/nfs/pnfs.c b/fs/nfs/pnfs.c
>> index dd2e14f5875d..d84c1b7b71d2 100644
>> --- a/fs/nfs/pnfs.c
>> +++ b/fs/nfs/pnfs.c
>> @@ -2170,7 +2170,7 @@ _pnfs_grab_empty_layout(struct inode *ino, struct nfs_open_context *ctx)
>>  	struct pnfs_layout_hdr *lo;
>>  
>>  	spin_lock(&ino->i_lock);
>                    ^^^
>> -	lo = pnfs_find_alloc_layout(ino, ctx, GFP_KERNEL);
>> +	lo = pnfs_find_alloc_layout(ino, ctx, GFP_ATOMIC);
>                                     ^^^
> It releases the lock before allocating.  It's annotated.
> 

Got it, thanks.

regards,
Wei Yongjun
