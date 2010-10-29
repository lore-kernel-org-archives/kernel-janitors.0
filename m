From: Benny Halevy <bhalevy@panasas.com>
Date: Fri, 29 Oct 2010 07:33:29 +0000
Subject: Re: [patch] nfs: check kmalloc() return
Message-Id: <4CCA78C9.5000308@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101028044403.GV6062@bicker> <4CC92338.7070304@bfs.de> <1288273273.3194.16.camel@heimdal.trondhjem.org> <4CC98534.40907@panasas.com> <20101028165708.GH6062@bicker>
In-Reply-To: <20101028165708.GH6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, wharms@bfs.de, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2010-10-28 18:57, Dan Carpenter wrote:
> On Thu, Oct 28, 2010 at 04:14:12PM +0200, Benny Halevy wrote:
>>>>> diff --git a/fs/nfs/nfs4filelayoutdev.c b/fs/nfs/nfs4filelayoutdev.c
>>>>> index 51fe64a..098113c 100644
>>>>> --- a/fs/nfs/nfs4filelayoutdev.c
>>>>> +++ b/fs/nfs/nfs4filelayoutdev.c
>>>>> @@ -219,6 +219,8 @@ decode_and_add_ds(__be32 **pp, struct inode *inode)
>>>>>  		goto out_err;
>>>>>  	}
>>>>>  	buf = kmalloc(rlen + 1, GFP_KERNEL);
>>>>> +	if (!buf)
>>>>> +		goto out_err;
>>>>>  	buf[rlen] = '\0';
>>>>>  	memcpy(buf, r_addr, rlen);
>>>>>  
>>>>
>>>> it seems that r_addr is a string, then kstdup() is emulated here.
>>>>
>>>> re,
>>>>  wh
>>>
>>> Not quite. kstrdup() requires that the argument be a NUL-terminated
>>> string. The above code doesn't.
>>
>> Right.  kmemdup is the right one.
>>
> 
> We need to duplicate the data and also add a NUL char on the end.

You're right.

> kmemdup() only does the first bit.  You could copy one char past the end
> so you have space for the NUL but that's not the right idea.

If rlen is divisible by 4 you can't be sure you'll have an extra character to
copy.

So the check you added is probably the simplest solution.

Benny

> 
> Anyway, I'm out of here for the next few days.  :)  See you after the
> weekend.
> 
> regards,
> dan carpenter
> 
