From: Jiri Kosina <jikos@kernel.org>
Date: Sun, 10 May 2020 21:51:04 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to livepatch .klp.arch removal
Message-Id: <nycvar.YFH.7.76.2005102350050.25812@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509073258.5970-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200509073258.5970-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, live-patching@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 9 May 2020, Lukas Bulwahn wrote:

> Commit 1d05334d2899 ("livepatch: Remove .klp.arch") removed
> arch/x86/kernel/livepatch.c, but missed to adjust the LIVE PATCHING entry
> in MAINTAINERS.
> 
> Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches  F:  arch/x86/kernel/livepatch.c
> 
> So, drop that obsolete file entry in MAINTAINERS.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

I've added

	Fixes: 1d05334d2899 ("livepatch: Remove .klp.arch")

and applied, thanks.

-- 
Jiri Kosina
SUSE Labs
