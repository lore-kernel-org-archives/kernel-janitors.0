From: Phillip Lougher <phillip@lougher.demon.co.uk>
Date: Fri, 08 Nov 2013 01:34:38 +0000
Subject: Re: squashfs: enhance parallel I/O
Message-Id: <527C3FAE.1040906@lougher.demon.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131106161836.GN15603@elgon.mountain>
In-Reply-To: <20131106161836.GN15603@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/11/13 01:27, Minchan Kim wrote:
> On Thu, Nov 7, 2013 at 2:33 AM, Phillip Lougher
> <phillip.lougher@gmail.com>wrote:
>
>> On Wed, Nov 6, 2013 at 4:18 PM, Dan Carpenter <dan.carpenter@oracle.com>wrote:
>>
>>> Hello Minchan Kim,
>>>
>>> This is a semi-automatic email about new static checker warnings.
>>>
>>> The patch 8ae6a7f5a3a8: "squashfs: enhance parallel I/O" from Oct 28,
>>> 2013, leads to the following Smatch complaint:
>>>
>>> fs/squashfs/decompressor_multi.c:124 squashfs_decompressor_destroy()
>>>           error: we previously assumed 'stream' could be null (see line
>>> 111)
>>>
>>> fs/squashfs/decompressor_multi.c
>>>     110          struct squashfs_stream *stream = msblk->stream;
>>>     111          if (stream) {
>>>                      ^^^^^^
>>> Patch introduces a check.
>>>
>>>     112                  struct decomp_stream *decomp_strm;
>>>     113
>>>     114                  while (!list_empty(&stream->strm_list)) {
>>>     115                          decomp_strm >>> list_entry(stream->strm_list.prev,
>>>     116                                                  struct
>>> decomp_stream, list);
>>>     117                          list_del(&decomp_strm->list);
>>>     118
>>>   msblk->decompressor->free(decomp_strm->stream);
>>>     119                          kfree(decomp_strm);
>>>     120                          stream->avail_decomp--;
>>>     121                  }
>>>     122          }
>>>     123
>>>     124          WARN_ON(stream->avail_decomp);
>>>     125          kfree(stream->comp_opts);
>>>                        ^^^^^^^^^^^^^^^^^
>>>
>>
>> Hi Minchan,
>>
>> These two lines should be moved into the scope of the if (stream) { } ...
>>
>> Do you want to send a V3 patch?  Or I can add a fix-up patch to this V2
>> patch,
>> whatever you prefer.
>>
>
>
> My bad, :(
> Confirmed.
>
> Phillip, Please add a fix-up patch to v2 patch.
> Thanks, Dan and Phillip.
>

np :-)   I'll send the fix-up patch tomorrow.

Dan, I'll credit you with a Reported-by, unless you object.

Phillip

>

