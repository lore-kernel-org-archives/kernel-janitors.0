From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 17 Jun 2019 13:43:47 +0000
Subject: Re: [PATCH] tracing: remove redundant assignment to pointer 'event'
Message-Id: <72356d9c-503b-d5e9-bc0b-2f31e3c49806@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617123722.27376-1-colin.king@canonical.com>
 <20190617094244.14562920@gandalf.local.home>
In-Reply-To: <20190617094244.14562920@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 17/06/2019 14:42, Steven Rostedt wrote:
> On Mon, 17 Jun 2019 13:37:22 +0100
> Colin King <colin.king@canonical.com> wrote:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The value assigned to pointer 'event' is never read and hence it
>> is redundant and can be removed.
>>
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  kernel/trace/trace_events_hist.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
>> index ca6b0dff60c5..0013b43d8b4d 100644
>> --- a/kernel/trace/trace_events_hist.c
>> +++ b/kernel/trace/trace_events_hist.c
>> @@ -1294,7 +1294,6 @@ static int __create_synth_event(int argc, const char *name, const char **argv)
>>  	event = alloc_synth_event(name, n_fields, fields);
>>  	if (IS_ERR(event)) {
>>  		ret = PTR_ERR(event);
>> -		event = NULL;
> 
> This is one of those cases where I rather not touch it.
> 
> Yeah, it may not be read, but assigning event to NULL isn't dangerous
> here. And if we change the code to expect event to be NULL or something
> real, it is better to keep this.

OK, makes sense.

> 
> -- Steve
> 
> 
> 
>>  		goto err;
>>  	}
>>  	ret = register_synth_event(event);
> 
