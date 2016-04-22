From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Apr 2016 09:54:23 +0000
Subject: re: tracing: Add 'hist' event trigger command
Message-Id: <20160422095423.GA11398@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Tom Zanussi,

This is a semi-automatic email about new static checker warnings.

The patch 7ef224d1d0e3: "tracing: Add 'hist' event trigger command" 
from Mar 3, 2016, leads to the following Smatch complaint:

kernel/trace/trace_events_hist.c:374 create_hist_field()
	 error: we previously assumed 'field' could be null (see line 352)

kernel/trace/trace_events_hist.c
   351	
   352		if (field && is_function_field(field))
                    ^^^^^
New check for NULL.

   353			return NULL;
   354	
   355		hist_field = kzalloc(sizeof(struct hist_field), GFP_KERNEL);
   356		if (!hist_field)
   357			return NULL;
   358	
   359		if (flags & HIST_FIELD_FL_HITCOUNT) {
   360			hist_field->fn = hist_field_counter;
   361			goto out;
   362		}
   363	
   364		if (flags & HIST_FIELD_FL_STACKTRACE) {
   365			hist_field->fn = hist_field_none;
   366			goto out;
   367		}
   368	
   369		if (flags & HIST_FIELD_FL_LOG2) {
   370			hist_field->fn = hist_field_log2;
   371			goto out;
   372		}
   373	
   374		if (is_string_field(field)) {
                                    ^^^^^
New unchecked dereference inside function.

   375			flags |= HIST_FIELD_FL_STRING;
   376	

regards,
dan carpenter
