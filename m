From: walter harms <wharms@bfs.de>
Date: Sun, 12 May 2019 18:44:11 +0000
Subject: Re: [PATCH 2/2] afs: Fix afs_xattr_get_yfs() to not try freeing an error value
Message-Id: <5CD8697B.6010004@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5CD844B0.5060206@bfs.de> <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk> <155764714872.24080.15171754166782593095.stgit@warthog.procyon.org.uk> <31808.1557684645@warthog.procyon.org.uk>
In-Reply-To: <31808.1557684645@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: colin.king@canonical.com, joe@perches.com, jaltman@auristor.com, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 12.05.2019 20:10, schrieb David Howells:
> walter harms <wharms@bfs.de> wrote:
> 
>>> +	ret = dsize;
>>> +	if (size > 0) {
>>> +		if (dsize > size) {
>>> +			ret = -ERANGE;
>>> +			goto error_key;
>>>  		}
>>> +		memcpy(buffer, data, dsize);
>>>  	}
>>>  
>>
>> i am confused: if size is <= 0 then the error is in dsize ?
> 
> See this bit, before that hunk:
> 
>> +	if (ret < 0)
>> +		goto error_key;
> 
> David
> 

Sorry, you misunderstood me, my fault, i did not see that size is unsigned.
NTL i do not think size=0 is useful.

You get size from outside, and if i follow the flow correct
the first use of it is to check size>0.
perhaps you can check size at start and simply return.
Now if size=0 it will return dsize and give the impression
that buffer is used (it is not).

while you are there:
  flags |= YFS_ACL_WANT_ACL is always flags = YFS_ACL_WANT_ACL;
since flags is 0 at this point.
IMHO that sould be moved to the strcmp() section.

hope that helps,

re,
 wh
