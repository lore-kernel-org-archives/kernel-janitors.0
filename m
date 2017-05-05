From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 21:06:16 +0000
Subject: [PATCH 6/7] kernel-trace: Adjust two checks for null pointers in uprobe_buffer_init()
Message-Id: <108d781f-8dba-9bf8-1a44-adb3952d3b46@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
In-Reply-To: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



Am 05.05.2017 um 23:00 schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 May 2017 22:50:05 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (7):
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
