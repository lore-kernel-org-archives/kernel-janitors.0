From: Benny Halevy <bhalevy@panasas.com>
Date: Thu, 28 Oct 2010 14:14:12 +0000
Subject: Re: [patch] nfs: check kmalloc() return
Message-Id: <4CC98534.40907@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101028044403.GV6062@bicker>  <4CC92338.7070304@bfs.de> <1288273273.3194.16.camel@heimdal.trondhjem.org>
In-Reply-To: <1288273273.3194.16.camel@heimdal.trondhjem.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: wharms@bfs.de, Dan Carpenter <error27@gmail.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2010-10-28 15:41, Trond Myklebust wrote:
> On Thu, 2010-10-28 at 09:16 +0200, walter harms wrote:
>>
>> Dan Carpenter schrieb:
>>> The decode_and_add_ds() should return NULL on failure.
>>>
>>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>>>
>>> diff --git a/fs/nfs/nfs4filelayoutdev.c b/fs/nfs/nfs4filelayoutdev.c
>>> index 51fe64a..098113c 100644
>>> --- a/fs/nfs/nfs4filelayoutdev.c
>>> +++ b/fs/nfs/nfs4filelayoutdev.c
>>> @@ -219,6 +219,8 @@ decode_and_add_ds(__be32 **pp, struct inode *inode)
>>>  		goto out_err;
>>>  	}
>>>  	buf = kmalloc(rlen + 1, GFP_KERNEL);
>>> +	if (!buf)
>>> +		goto out_err;
>>>  	buf[rlen] = '\0';
>>>  	memcpy(buf, r_addr, rlen);
>>>  
>>
>> it seems that r_addr is a string, then kstdup() is emulated here.
>>
>> re,
>>  wh
> 
> Not quite. kstrdup() requires that the argument be a NUL-terminated
> string. The above code doesn't.

Right.  kmemdup is the right one.

Benny

> 
> Trond
> --
> To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
