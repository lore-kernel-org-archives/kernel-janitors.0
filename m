From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 20 Jan 2005 15:44:24 +0000
Subject: Re: [KJ] [PATCH] unified spinlock
Message-Id: <41EFD1D8.7090305@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <41EFCFDC.4060509@osdl.org>
In-Reply-To: <41EFCFDC.4060509@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Matthew Wilcox wrote:
> On Thu, Jan 20, 2005 at 07:35:56AM -0800, Randy.Dunlap wrote:
> 
>>Matthew Wilcox wrote:
>>
>>>On Thu, Jan 20, 2005 at 08:56:18PM +0530, Amit Gud wrote:
>>>
>>>
>>>>Unify the spinlock initialization as far as possible.
>>>
>>>
>>>Why would you want to replace a statically initialised spinlock with
>>>one that's initialised at runtime?
>>
>>I wondered that also, since I prefer the compile-time inits myself.
>>so I looked at the KJ TODO list
>><http://janitor.kernelnewbies.org/TODO> and it says:
>>
>>From: Jonathan Corbet
>>
>>Unified spinlock initialization:
>>convert all explicit lock initializations to spin_lock_init() or
>>rwlock_init().  (Besides consistency this also helps automatic lock
>>validators and debugging code.)
>>
>>http://lwn.net/Articles/109505/
>>http://linux.bkbits.net:8080/linux-2.6/cset@419a6f292wHnthuDzw7VfgECNLmvLg?nav=index.html|ChangeSet@-8w
>>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>>I don't find the consistency part compelling at all.
>>If the change helps some static source analyzers, however, that would
>>be a good thing, but not a strong one (IMO).
> 
> 
> I think this is referring to initialisation of spinlocks that are
> allocated dynamically, not statically.  If a lock validator can't cope
> with that, it needs to be fixed, IMO.
> 
Having just looked at the LWN.net article, is this (still) true?

<quote>
The stated reasons for this change include consistency and making life 
easier for automatic lock validators. There is also an unstated, but 
evident reason: the assignment form of lock initialization gets in the 
way of the realtime preemption patches. Those patches change most 
spinlocks in the kernel to a different, mutex type, and that breaks 
the initializers. As a result, the preemption patches must change all 
of those initializations throughout the kernel. By putting those 
specific changes into the mainline, it is possible to make the 
realtime patches smaller, less intrusive, and a little bit less scary.
</quote>

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
