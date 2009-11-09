From: walter harms <wharms@bfs.de>
Date: Mon, 09 Nov 2009 08:16:21 +0000
Subject: Re: [PATCH] mm/ksm.c - Fix compile warnings (PS ignore my formatting
Message-Id: <4AF7CFD5.5080801@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1257317010.14838.55.camel@linux-k65f.site>	 <4AF15022.1020408@bfs.de> <1257334139.14838.264.camel@linux-k65f.site>
In-Reply-To: <1257334139.14838.264.camel@linux-k65f.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: askb <askb23@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



askb schrieb:
> On Wed, 2009-11-04 at 10:57 +0100, walter harms wrote:
>> askb schrieb:
>>> Found the compiler warning on linux-next: 	
>>>
>>> mm/ksm.c: In function ‘ksm_scan_thread’:
>>> mm/ksm.c:1083: warning: ‘page2[0u]’ may be used uninitialized in this
>>> function
>>> mm/ksm.c:1083: note: ‘page2[0u]’ was declared here
>>>
>>> fix for the above warning:
>>>
>>> Signed-off-by: Anil SB <askb23@gmail.com>
>>>
>>> diff --git a/mm/ksm.c b/mm/ksm.c
>>> index bef1af4..2ea0fd3 100644
>>> --- a/mm/ksm.c
>>> +++ b/mm/ksm.c
>>> @@ -1080,7 +1080,7 @@ static void stable_tree_append(struct rmap_item *rmap_item,
>>>   */
>>>  static void cmp_and_merge_page(struct page *page, struct rmap_item *rmap_item)
>>>  {
>>> -	struct page *page2[1];
>>> +	struct page *page2[1] = {NULL};
>>>  	struct rmap_item *tree_rmap_item;
>>>  	unsigned int checksum;
>>>  	int err;
>>>
>>>
>> a 1 element array looks strange, did you look what kind of magic is here used ?
>>
>>From my understanding, it is used for place holder to check and return
> an identical page from stable_tree_search(). Can we do with a double
> indirection to struct page instead of the above? 
> PS point me in the right direction.
> 

1. sorry for delay.

2. there is no "right" direction. the result should be clear for the code, and this
may change between releases, special circumstances may occur and so on.

You may try something like that:

struct page *dst ;

	function ( &dst );

IMHO that would clarify the code and fix the naming (page,page2 is not very descriptiv).


re,
 wh

