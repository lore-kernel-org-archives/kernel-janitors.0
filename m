From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 07 Mar 2005 00:51:07 +0000
Subject: Re: [KJ] kernel-parameters.txt
Message-Id: <422BA57B.1050409@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <422A58AB.8040601@osdl.org>
In-Reply-To: <422A58AB.8040601@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Eamonn Lachlan wrote:
> Randy wrote:
> 
>> ... [Documentation/x86_64/boot-options.txt]
>>should be merged into kernel-parameters.txt,
>>with indications that they are X86-64 only.
> 
> 
> I'll have a look at merging the two files first, then,
> alright?

Sounds good/right to me, but please check with Andi Kleen
(ak@suse.de) to see if he will merge it, so that you don't
waste your time.

> A quick grep of the arch trees in 2.6.11 says there are 
> 
>    1 arch/alpha       1 arch/ppc
>   11 arch/arm         9 arch/ppc64
>    5 arch/arm26       5 arch/s390
>   21 arch/i386        4 arch/sh
>   12 arch/ia64        2 arch/sh64
>    1 arch/m32r        1 arch/sparc
>    3 arch/mips        8 arch/um
>    2 arch/parisc     22 arch/x86_64
> 
> so many occurences of "__setup(".
> 
> But in the kernel-parameters.txt file, I only see only
> four params with a PPC* arch flag where I would expect
> to find ten.
> 
> There seem to be a lot missing. :)
> 
> Should I hunt the missing params down in their arch trees
> and add them in?

Yes, that's would I would prefer to see, but again, I don't
want you wasting time on it if it won't be merged.

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
