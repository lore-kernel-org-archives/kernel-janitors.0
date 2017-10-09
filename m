From: Joe Perches <joe@perches.com>
Date: Mon, 09 Oct 2017 20:20:09 +0000
Subject: Re: [PATCH] kernel/trace: Delete five error messages for a failed memory allocation
Message-Id: <1507580409.3552.15.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c0d21fa1-a40f-92e5-821c-66e2596112c9@users.sourceforge.net>
         <20171009161337.7c35911f@gandalf.local.home>
In-Reply-To: <20171009161337.7c35911f@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>

On Mon, 2017-10-09 at 16:13 -0400, Steven Rostedt wrote:
> On Sat, 7 Oct 2017 16:15:14 +0200
> SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> 
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sat, 7 Oct 2017 16:10:06 +0200
> > 
> > Omit extra messages for a memory allocation failure in these functions.
> 
> Does memory allocation failures have printk messages? If not, then I
> think this is removing useful information.

Every k.alloc failure without __GFP_NOWARN does a dump_stack()

