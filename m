From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 24 Jan 2005 23:32:33 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <41F58591.7070202@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Domen Puncer wrote:
> Hi.
> 
> Removed some finished, invalid, duplicate entries.
> Replaced inline explanation with summary and URL to original post.
> Comments, objections to any change?
> 
> Second stage, that i'm doing now is to put stuff into sections (like it
> is at the beginning of file).
> I'm also thinking about ordering from easiest to hardest.
> Ideas, comments?


This one:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 From Linus:

Check stack usage and reduce it in the worst cases.
See:  http://bugme.osdl.org/show_bug.cgi?id86
There is another script that checks function stack usage at
http://kernelnewbies.org/scripts/ .
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

should be changed to something like (with edits if/as you prefer):
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Use a series of commands like (e.g.)
   make allmodconfig
   make all
   make checkstack >stack.report

and then look at 'stack.report' and search for large
stack users.  Generally, if a function uses more than
around 1000 bytes of stack space, it should be considered
for stack reduction by some appropriate means (where
'appropriate' varies depending on some analysis, such as
code review or dumping object code), either by dynamic allocation
of (current) on-stack structures, un-inlining some functions
whose combined stack sizes add up, moving parts of functions
that declare data to separate functions, or some other means.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
