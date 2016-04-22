From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 22 Apr 2016 15:34:39 +0000
Subject: Re: tracing: Add 'hist' event trigger command
Message-Id: <20160422113439.53c7b260@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160422095423.GA11398@mwanda>
In-Reply-To: <20160422095423.GA11398@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 22 Apr 2016 10:14:30 -0500
Tom Zanussi <tom.zanussi@linux.intel.com> wrote:


> On 04/22/2016 04:54 AM, Dan Carpenter wrote:
> > Hello Tom Zanussi,
> >
> > This is a semi-automatic email about new static checker warnings.
> >
> > The patch 7ef224d1d0e3: "tracing: Add 'hist' event trigger command"
> > from Mar 3, 2016, leads to the following Smatch complaint:
> >
> > kernel/trace/trace_events_hist.c:374 create_hist_field()
> > 	 error: we previously assumed 'field' could be null (see line 352)
> >
> > kernel/trace/trace_events_hist.c
> >     351	
> >     352		if (field && is_function_field(field))
> >                      ^^^^^
> > New check for NULL.
> >
> >     353			return NULL;
> >     354	
> >     355		hist_field = kzalloc(sizeof(struct hist_field), GFP_KERNEL);
> >     356		if (!hist_field)
> >     357			return NULL;
> >     358	
> >     359		if (flags & HIST_FIELD_FL_HITCOUNT) {
> >     360			hist_field->fn = hist_field_counter;
> >     361			goto out;
> >     362		}
> >     363	
> >     364		if (flags & HIST_FIELD_FL_STACKTRACE) {
> >     365			hist_field->fn = hist_field_none;
> >     366			goto out;
> >     367		}
> >     368	
> >     369		if (flags & HIST_FIELD_FL_LOG2) {
> >     370			hist_field->fn = hist_field_log2;
> >     371			goto out;
> >     372		}
> >     373	

Perhaps add here:

	if (WARN_ON_ONCE(!field))
		goto out;

-- Steve

> >     374		if (is_string_field(field)) {
> >                                      ^^^^^
> > New unchecked dereference inside function.
> >
> >     375			flags |= HIST_FIELD_FL_STRING;
> >     376	
> >
> > regards,
> > dan carpenter
> >  

