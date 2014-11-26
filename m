From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Nov 2014 15:46:35 +0000
Subject: Re: [patch] tracing: off by one in __trace_array_vprintk()
Message-Id: <20141126154635.GI4835@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141126140621.GA18740@mwanda>
 <20141126092706.5d4038d4@gandalf.local.home>
 <20141126143719.GT4893@mwanda>
 <20141126094306.4f465616@gandalf.local.home>
 <20141126150541.GU4893@mwanda>
 <20141126102244.4bffa4b2@gandalf.local.home>
In-Reply-To: <20141126102244.4bffa4b2@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 26, 2014 at 10:22:44AM -0500, Steven Rostedt wrote:
> On Wed, 26 Nov 2014 18:05:41 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > On Wed, Nov 26, 2014 at 09:43:06AM -0500, Steven Rostedt wrote:
> > > I highly doubt it's much of a speed up. And we do that by sacrificing
> > > that one byte of buffer, which would lose the printk if len does equal
> > > TRACE_BUF_SIZE.
> > > 
> > > I don't see a bug here. What exactly are you trying to fix?
> > 
> > Heh.  vsnprintf() is going to put a NUL char at the end of the string
> > even if you don't plan to use it.  :P
> > 
> > Another option would be to just print truncated output.  We could use
> > vscnprintf() and remove the off by one limit check.
> 
> Yes, that is a better patch. The previous one wasn't really fixing
> anything. But printing truncated output is better than nothing.
> 
> Want to send it officially?
> 

Will do.

regards,
dan carpenter

