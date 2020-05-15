From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Date: Fri, 15 May 2020 08:23:25 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to livepatch .klp.arch removal
Message-Id: <509c316f-5b34-2859-49aa-e4fe4a407428@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509073258.5970-1-lukas.bulwahn@gmail.com>
 <bfe91b2d-e319-bf12-6a15-4f200d0e8ea4@linux.vnet.ibm.com>
 <nycvar.YFH.7.76.2005142344230.25812@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2005142344230.25812@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, live-patching@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/15/20 3:15 AM, Jiri Kosina wrote:
> On Sat, 9 May 2020, Kamalesh Babulal wrote:
> 
>>> Commit 1d05334d2899 ("livepatch: Remove .klp.arch") removed
>>> arch/x86/kernel/livepatch.c, but missed to adjust the LIVE PATCHING entry
>>> in MAINTAINERS.
>>>
>>> Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
>>>
>>>   warning: no file matches  F:  arch/x86/kernel/livepatch.c
>>>
>>> So, drop that obsolete file entry in MAINTAINERS.
>>
>> Patch looks good to me,  you probably want to add following architecture
>> specific livepatching header files to the list:
>>
>> arch/s390/include/asm/livepatch.h
>> arch/powerpc/include/asm/livepatch.h
> 
> Good point, thanks for spotting it Kamalesh. I've queued the patch below 
> on top.
> 
> 

Thanks, Jiri. I realized later, that the lib/livepatch directory also needs
to be included in the list of files maintained under livepatch. Earlier, this
week I had sent a patch to the mailing list that includes both arch
headers and lib/livepatch to the list of files, the link to the patch is:

https://lore.kernel.org/live-patching/20200511061014.308675-1-kamalesh@linux.vnet.ibm.com/


-- 
Kamalesh
