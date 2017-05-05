From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 05 May 2017 21:06:07 +0000
Subject: Re: [PATCH 0/7] kernel-trace: Fine-tuning for seven function implementations
Message-Id: <20170505170607.2555fdcf@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
In-Reply-To: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, 5 May 2017 23:00:41 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 May 2017 22:50:05 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (7):

Hi Markus,

Just to let you know, it's never a good idea to send new patches out
during the merge window. They are most likely to be missed and
forgotten during this time. Unless they are critical bug fixes, it's
best to wait till after a merge window.

I wont be touching or even looking at these until after 4.12-rc1 is
released. Feel free to reply to this email with a ping in a week or two.

Thanks,

-- Steve

>   Combine two function calls into one in hist_trigger_entry_print()
>   Replace five seq_puts() calls by seq_putc()
>   Adjust two checks for null pointers in compatible_field()
>   Improve a size determination in create_hist_field()
>   Replace two seq_printf() calls by seq_puts() in probes_seq_show()
>   Adjust two checks for null pointers in uprobe_buffer_init()
>   Delete an error message for a failed memory allocation in create_trace_uprobe()
> 
>  kernel/trace/trace_events_hist.c | 18 ++++++++----------
>  kernel/trace/trace_uprobe.c      | 10 ++++------
>  2 files changed, 12 insertions(+), 16 deletions(-)
> 

