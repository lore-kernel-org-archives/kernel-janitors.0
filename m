From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Sat, 17 Mar 2007 15:00:21 +0000
Subject: Re: [KJ] [PATCH 2.6.21-rc4] kernel/exit: Fix a comment and code
Message-Id: <20070317150021.GA3618@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070317062132.GA11326@Ahmed>
In-Reply-To: <20070317093856.GB32496@leiferikson>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes-kernel@saeurebad.de
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, trivial@kernel.org

[Johannes please use replay-to-all to notify all readers]

On 2007-03-17 9:45:36 Johannes Weiner wrote:
> On Sat, Mar 17, 2007 at 08:21:32AM +0200, Ahmed S. Darwish wrote:
> > Comment in release_task() claims that group leader's parent process 
> > is signalled only if it desires so, which is not true.
>
> AFAIS, `if it wants notification' means, it does not ignore its children
> via SIG_IGN als handler for SIGCHLD.
>

AFAIK, exit_signal = -1 means that the parent don't want to be signalled,
like what happenes when using CLONE_THREAD. 

But it's even signalled in that case (after issuing a BUG):
   BUG_ON(leader->exit_signal = -1);
   do_notify_parent(leader, leader->exit_signal);

> do_notify_parent() checks if the parent wants to get informed about the
> child states.
>

Yes it does the check but it notifies the given task_struct anyway:

	BUG_ON(sig = -1);
	[ Continue parent notification normally ]
-- 
Ahmed S. Darwish
http://darwish.07.googlepages.com

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
