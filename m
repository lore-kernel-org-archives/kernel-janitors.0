From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 26 Feb 2020 23:56:10 +0000
Subject: Re: [PATCH] NFS: check for allocation failure from mempool_alloc
Message-Id: <ff2605b3-aefd-04c5-7d50-dc73091cb34e@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200226234320.7722-1-colin.king@canonical.com>
 <12d1e7a2ce5b0c64dfd81aeda75879c460e59fcb.camel@hammerspace.com>
In-Reply-To: <12d1e7a2ce5b0c64dfd81aeda75879c460e59fcb.camel@hammerspace.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trondmy@hammerspace.com>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 26/02/2020 23:48, Trond Myklebust wrote:
> On Wed, 2020-02-26 at 23:43 +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> It is possible for mempool_alloc to return null when using
>> the GFP_KERNEL flag, so return NULL and avoid a null pointer
>> dereference on the following memset of the null pointer.
> 
> Umm, no. That would be a false positive by coverity.

Ah, sorry for the noise then.

> 
> If you look at the history of that function, you'll note that we
> originally had those checks, but that Neil Brown removed them after
> analysis of the mempool_alloc() function. He determined (correctly, I
> believe) that any value that includes GFP_WAIT cannot fail to return a
> valid pointer.

OK - that's very helpful to know. That allows me to mark a shed load of
false positives on mempool_alloc false positives.

Colin

> 
>>
>> Addresses-Coverity: ("Dereference null return")
>> Fixes: 2b17d725f9be ("NFS: Clean up writeback code")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  fs/nfs/write.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/fs/nfs/write.c b/fs/nfs/write.c
>> index c478b772cc49..7ca036660dd1 100644
>> --- a/fs/nfs/write.c
>> +++ b/fs/nfs/write.c
>> @@ -106,6 +106,9 @@ static struct nfs_pgio_header
>> *nfs_writehdr_alloc(void)
>>  {
>>  	struct nfs_pgio_header *p = mempool_alloc(nfs_wdata_mempool,
>> GFP_KERNEL);
>>  
>> +	if (!p)
>> +		return NULL;
>> +
>>  	memset(p, 0, sizeof(*p));
>>  	p->rw_mode = FMODE_WRITE;
>>  	return p;
