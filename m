From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sat, 05 Mar 2005 17:54:14 +0000
Subject: Re: [KJ] compile warnings due to change of pci resource element type
Message-Id: <4229F246.9020101@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42287935.30573.366952@localhost>
In-Reply-To: <42287935.30573.366952@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Stephen Biggs wrote:
> On 5 Mar 2005 at 8:04, Nish Aravamudan wrote:
> 
> 
>>On Sat, 05 Mar 2005 11:33:37 +0200, Stephen Biggs
>><yrgrknmxpzlk@gawab.com> wrote:
>>
>>>On 4 Mar 2005 at 8:57, Greg KH wrote:
>>>
>>>
>>>>On Fri, Mar 04, 2005 at 07:49:45AM -0800, Randy.Dunlap wrote:
>>>>
>>>>>Stephen Biggs wrote:
>>>>>
>>>>>>Trying to comple the latest version (2.6.11-rc5-mm1) gives a huge amount
>>>>>>of warnings in a lot of files due to printf formats (and a couple of
>>>>>>other minor issues) that have %lx instead of %llx for the "start" element
>>>>>>in the pci_resource struct whose type was changed from u32 to u64.
>>>>>>
>>>>>>These are relatively easy to fix and need to be fixed because of
>>>>>>potential stack issues with var arg functions like printk and friends.
>>>>>>
>>>>>>My question is: should I do this or is someone else working on this,
>>>>>>perhaps a better fix than simply changing the majority of occurrences of
>>>>>>"%lx" to "%llx"?
>>>>>
>>>>>I read messages on lkml that the pci resource patch was being dropped
>>>>>temporarily to fix some issues.... Perhaps its patch submitter will
>>>>>be fixing those, I dunno.
>>>>
>>>>Odds are, it will be me :(
>>>>
>>>>So yes, I will gladly take those kinds of patches.
>>>
>>>Yes, OK, I'll start working on it soon.
>>>
>>>Quick question: I see these problems on 2.6.11-rc5-mm1 but NOT on the
>>>mainline kernel of 2.6.11.  Also, see my previous email about 2.6.11-kj
>>>patch not applying cleanly at all to the rc5-mm1 BUT applies perfectly to
>>>the mainline 2.6.11.
>>>
>>>Which kernel version should I be working with?  Since there is now a
>>>release of 2.6.11, isn't the proper version for us now 2.6.12-rc1, as
>>>soon as it's created??
>>>
>>>I am confused.
>>
>>I am not sure why you would think 2.6.11-kj would apply to anything
>>except 2.6.11. That's why it's *2.6.11*-kj not 2.6.11-rc5-mm1-kj.
>>That's the whole point of labelling the releases that way.
> 
> 
> Yes, thanks for the clear explanation.
> 
> 
>>So, if you want to apply -kj, you apply to it's prefix. Sometimes,
>>admittedly, it will apply with fuzz to other trees, but that's
>>incidental.
> 
> 
> Ok, this I can understand and accept.
> 
> 
>>Also, please read the threads regarding the new kernel naming
>>procedure. You should apply your patches against mainline (currently
>>2.6.11), unless the issue only exists in -mm and the patch which
>>causes the issue is also only in -mm.
> 
> 
> Here is the source of my confusion:
> http://lists.osdl.org/pipermail/kernel-janitors/2005-February/003315.html
> 
> ... wherein Jim Nelson says, in part: "Work off of -mm, since most of the 
> janitorial work will go through Andrew Morton's series for awhile before 
> being pushed into mainline."

This is the problem, then.  Most developers work off of Linus's
tree (bk or bk snapshots) as a base.  Even Andrew suggests
doing that unless the code that you are patching is only in
-mm.  Andrew must work 20 hours/day, because he is willing
to convert patches to merge into his -mm patchset.

> Can you please send me links to the threads you are referring to so I can 
> read them for myself and get a grip on this?
> 
> However, even with the naming issues cleared up in my head, I am still 
> confused by the other issue. I am assuming that the pci resource retype 
> is only in -mm?  If so, I am still confused about which version to work 
> off of.  That is, if I apply the -kj patch to the mainline, I should then 
> apply the -mm patch that just now appeared in Andrew Morton's directore 
> for the mainline?
> 
> Maybe this is moot right now, since I see that this particular patch WAS 
> in 2.6.11-rc5-mm1, but is not in 2.6.11-mm1.  Guess I'll wait until this 
> is placed back in.

or find the most recent version of that patch (from 2.6.11-rc5-mm1),
apply it to 2.6.11-linus, and start making fixes to it.
Post the updates to lkml and linux-pci mailing list and cc:
Greg on them.

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
