From: Jiri Kosina <jikos@kernel.org>
Date: Fri, 15 May 2020 08:20:01 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to livepatch .klp.arch removal
Message-Id: <nycvar.YFH.7.76.2005151019150.25812@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509073258.5970-1-lukas.bulwahn@gmail.com> <bfe91b2d-e319-bf12-6a15-4f200d0e8ea4@linux.vnet.ibm.com> <nycvar.YFH.7.76.2005142344230.25812@cbobk.fhfr.pm> <509c316f-5b34-2859-49aa-e4fe4a407428@linux.vnet.ibm.com>
In-Reply-To: <509c316f-5b34-2859-49aa-e4fe4a407428@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, live-patching@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 15 May 2020, Kamalesh Babulal wrote:

> Thanks, Jiri. I realized later, that the lib/livepatch directory also 
> needs to be included in the list of files maintained under livepatch. 
> Earlier, this week I had sent a patch to the mailing list that includes 
> both arch headers and lib/livepatch to the list of files, the link to 
> the patch is:
> 
> https://lore.kernel.org/live-patching/20200511061014.308675-1-kamalesh@linux.vnet.ibm.com/

Ah, I wasn't CCed, so it fell in between cracks, sorry. Could you please 
resend the lib/livepatch part separately? I'll apply it on top.

Thanks,

-- 
Jiri Kosina
SUSE Labs
