From: Alexander Duyck <alexander.h.duyck@redhat.com>
Date: Tue, 10 Mar 2015 21:36:34 +0000
Subject: Re: fib_trie: Add tnode struct as a container for fields not needed in key_vector
Message-Id: <54FF63E2.20604@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150310210425.GA10841@mwanda>
In-Reply-To: <20150310210425.GA10841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On 03/10/2015 02:24 PM, Dan Carpenter wrote:
> On Tue, Mar 10, 2015 at 02:19:48PM -0700, Alexander Duyck wrote:
>> On 03/10/2015 02:04 PM, Dan Carpenter wrote:
>>> Hello Alexander Duyck,
>>>
>>> The patch dc35dbeda3e0: "fib_trie: Add tnode struct as a container
>>> for fields not needed in key_vector" from Mar 6, 2015, leads to the
>>> following static checker warnings:
>>>
>>> net/ipv4/fib_trie.c:330 leaf_new() warn: variable dereferenced before check 'kv' (see line 328)
>>> net/ipv4/fib_trie.c:358 tnode_new() warn: variable dereferenced before check 'tnode' (see line 350)
>> These two I am aware of, they are both false errors.  I am not
>> actually dereferencing so much as getting a pointer to an offset
>> inside the structure.  Think of it as an inverse offsetof().
> Oh, right.  I always forget about this possibility.  I'll see if I can
> fix the checker to not warn about these.
>
> regards,
> dan carpenter

If not you can can probably squelch it by changing them to &kv->kv[0] 
which might make it obvious to the checker.  If you can't fix the 
checker feel free to submit a patch to just massage the code to make it 
happy since the addition of a few additional operators in this case 
should make no functional difference.

- Alex


