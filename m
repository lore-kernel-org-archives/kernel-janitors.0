From: Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 23 May 2017 05:15:18 +0000
Subject: Re: [PATCH 3/7] kernel-trace: Adjust two checks for null pointers in compatible_field()
Message-Id: <20170523011518.4a81aad6@vmware.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
        <392fd14c-1a61-c3de-e5a7-14caaa51be75@users.sourceforge.net>
In-Reply-To: <392fd14c-1a61-c3de-e5a7-14caaa51be75@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, 5 May 2017 23:03:23 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 May 2017 20:00:11 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The script “checkpatch.pl” pointed information out like the following.
> 
> Comparison to NULL could be written !…
> 
> Thus fix the affected source code place.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  kernel/trace/trace_events_hist.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/trace_events_hist.c
> b/kernel/trace/trace_events_hist.c index df566e21344d..36412deac24c
> 100644 --- a/kernel/trace/trace_events_hist.c
> +++ b/kernel/trace/trace_events_hist.c
> @@ -1324,7 +1324,7 @@ static bool compatible_field(struct
> ftrace_event_field *field, {
>  	if (field = test_field)
>  		return true;
> -	if (field = NULL || test_field = NULL)
> +	if (!field || !test_field)

The first two are fine, this one isn't needed.

-- Steve

>  		return false;
>  	if (strcmp(field->name, test_field->name) != 0)
>  		return false;

