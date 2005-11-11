From: Matthew Dobson <colpatch@us.ibm.com>
Date: Fri, 11 Nov 2005 18:19:47 +0000
Subject: Re: [KJ] [PATCH 4/9] Create helper for /proc/slabinfo
Message-Id: <4374E0C3.4060202@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4373DF5D.8050106@us.ibm.com>
In-Reply-To: <4373DF5D.8050106@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

walter harms wrote:
> hi Matthew,
> just to have less #if in the code. it maybe usefull to make something
> like that in the beginning:
> 
> #if STATS
> #define STATS_VERSION "slabinfo - version: 2.1 (statistics)"
> #else
> #define STATS_VERSION "slabinfo - version: 2.1"
> #endif

We could do that, but we'd still need this #if in the function:

>>  #if STATS
>> -        seq_puts(m, " : globalstat <listallocs> <maxobjs> <grown>
>> <reaped>"
>> -                " <error> <maxfreeable> <nodeallocs> <remotefrees>");
>> -        seq_puts(m, " : cpustat <allochit> <allocmiss> <freehit>
>> <freemiss>");
>> +    seq_puts(m, " : globalstat <listallocs> <maxobjs> <grown> <reaped> "
>> +         "<error> <maxfreeable> <nodeallocs> <remotefrees>");
>> +    seq_puts(m, " : cpustat <allochit> <allocmiss> <freehit>
>> <freemiss>");
>>  #endif

so I don't think it buys us that much.  If it weren't for the second #if, I
would tend to agree with you.

> note i have silently droped "\n" are they realy needed ?

That I think is a big no-no.  This file is meant to be parsed by scripts,
so ANY change to the format would potentially break people's scripts and
would need an OK from the maintainer as well as a version number change
(aka: slabinfo - version: 2.2), and I think that is unecessary.

Thanks for your review.

-Matt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
