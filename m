From: walter harms <wharms@bfs.de>
Date: Wed, 03 Aug 2011 07:06:26 +0000
Subject: Re: [PATCH] Use kstrdup rather than duplicating its implementation
Message-Id: <4E38F372.7040900@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312302089.2629.15.camel@localhost.localdomain>
In-Reply-To: <1312302089.2629.15.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 02.08.2011 21:34, schrieb Thomas Meyer:
> Am Dienstag, den 02.08.2011, 21:05 +0300 schrieb Dan Carpenter:
>> On Tue, Aug 02, 2011 at 06:21:26PM +0200, Thomas Meyer wrote:
>>>  The semantic patch that makes this output is available
>>>  in scripts/coccinelle/api/kstrdup.cocci.
>>>
>>>  More information about semantic patching is available at
>>>  http://coccinelle.lip6.fr/
>>>
>>
>> These should be sent individually, because the chunks need to go into
>> a bunch of separate trees before they get merged into the official
>> kernel.  (One change per file basically on this).
>>
> 
> Does somebody maybe have a script for doing this split of an mbox file?
> maybe this script could also call get_maintainer.pl and change the To:
> field accordingly?
> 
> Just asking...
> 
> 

perhaps this can help ?
man cspilt

re,
 wh
