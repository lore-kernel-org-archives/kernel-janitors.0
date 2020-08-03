From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 03 Aug 2020 19:50:33 +0000
Subject: Re: [PATCH] gve: Fix the size used in a 'dma_free_coherent()' call
Message-Id: <639bc995-9d51-3cb7-a9d1-9979ecd9c912@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802141523.691565-1-christophe.jaillet@wanadoo.fr>
 <20200803084106.050eb7f6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <3a25ddc6-adaa-d17d-50f4-8f8ab2ed25eb@wanadoo.fr>
 <69b4c4838cb743e24a79f81de487ac2e494843ef.camel@perches.com>
In-Reply-To: <69b4c4838cb743e24a79f81de487ac2e494843ef.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>
Cc: csully@google.com, sagis@google.com, jonolson@google.com, davem@davemloft.net, lrizzo@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 03/08/2020 à 21:35, Joe Perches a écrit :
> On Mon, 2020-08-03 at 21:19 +0200, Christophe JAILLET wrote:
>> Le 03/08/2020 à 17:41, Jakub Kicinski a écrit :
>>> On Sun,  2 Aug 2020 16:15:23 +0200 Christophe JAILLET wrote:
>>>> Update the size used in 'dma_free_coherent()' in order to match the one
>>>> used in the corresponding 'dma_alloc_coherent()'.
>>>>
>>>> Fixes: 893ce44df5 ("gve: Add basic driver framework for Compute Engine Virtual NIC")
>>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>>
>>> Fixes tag: Fixes: 893ce44df5 ("gve: Add basic driver framework for Compute Engine Virtual NIC")
>>> Has these problem(s):
>>> 	- SHA1 should be at least 12 digits long
>>> 	  Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>>> 	  or later) just making sure it is not set (or set to "auto").
>>>
>>
>> Hi,
>>
>> I have git 2.25.1 and core.abbrev is already 12, both in my global
>> .gitconfig and in the specific .git/gitconfig of my repo.
>>
>> I would have expected checkpatch to catch this kind of small issue.
>> Unless I do something wrong, it doesn't.
>>
>> Joe, does it make sense to you and would one of the following patch help?
> 
> 18 months ago I sent:
> 
> https://lore.kernel.org/lkml/40bfc40958fca6e2cc9b86101153aa0715fac4f7.camel@perches.com/
> 
> 
> 

Looks like the same spirit.
I've not tested, but doesn't the:
    ($line =~ /(?:\s|^)[0-9a-f]{12,40}(?:[\s"'\(\[]|$)/i &&
at the top short cut the rest of the regex?

I read it as "the line should have something that looks like a commit id 
of 12+ char to process further".

So smaller commit id would not be checked.
Did I miss something?


Basically, my proposal is to replace this 12 by a 5 in order to accept 
smaller strings before checking if it looks well formatted or not.

CJ
