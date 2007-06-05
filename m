From: Yoann Padioleau <padator@wanadoo.fr>
Date: Tue, 05 Jun 2007 16:31:42 +0000
Subject: Re: [KJ] Re: [PATCH] bugfix GFP_KERNEL -> GFP_ATOMIC in spin_locked
Message-Id: <87ejkqe51t.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87odjvu1on.fsf@wanadoo.fr>
	<20070604210018.0eaa20a0.akpm@linux-foundation.org>
	<87k5uimzkh.fsf@wanadoo.fr> <200706051333.12219.oneukum@suse.de>
In-Reply-To: <200706051333.12219.oneukum@suse.de> (Oliver Neukum's message of
	"Tue, 5 Jun 2007 13:33:11 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Oliver Neukum <oneukum@suse.de>
Cc: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

Oliver Neukum <oneukum@suse.de> writes:

> Am Dienstag, 5. Juni 2007 13:05 schrieb Yoann Padioleau:
>> Ok. Do you have a preference on the format ?  a <file>:<line> format  ?
>> 
>> Is there a place that gathered all those implicit programming rules 
>> (that copy_from_user must not be called inside a spinlock, etc) so that
>> I can translate them in a script for our tool.
>
> How much C does your tool understand? 

The tool understands almost all the C language but the analysis we do
for the moment are intra-procedural so when we look for 
 spin_lock();
 ...
 copy_from_user();

it can detect cases and code paths only when the two function calls
are in the same function. It could be extended but it would require to
do a full analysis of the kernel source. Maybe if some functions of
the library have an attribute in their prototype in the .h such as

 __might_sleep copy_from_user(); 

it could help.

> You might basically
> test for code paths that go to "might_sleep()"

Ok, thanks. If you know other implicit programming rules,
I would be glad to know them, or if you know places
where thus rules are written.


BTW at one point I think the Linux community were using advanced
static analysis tools such as the one made by Dawson Engler (now
Coverity). The communitty have stopped using such tools ? Isn't the
role of sparse to detect bugs such as the dangerous copy_from_user()
inside spinlocked region ?


>
> 	Regards
> 		Oliver
>
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
