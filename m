From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jun 2014 17:40:04 +0000
Subject: re: tracing: Add help of snapshot feature when snapshot is empty
Message-Id: <20140620174004.GA10971@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Steven Rostedt (Red Hat),

This is a semi-automatic email about new static checker warnings.

The patch d8741e2e88ac: "tracing: Add help of snapshot feature when 
snapshot is empty" from Mar 5, 2013, leads to the following Smatch 
complaint:

kernel/trace/trace.c:2933 s_show()
	 error: we previously assumed 'iter->tr' could be null (see line 2927)

kernel/trace/trace.c
  2926		if (iter->ent = NULL) {
  2927			if (iter->tr) {
                            ^^^^^^^^
Existing check for "iter->tr".

  2928				seq_printf(m, "# tracer: %s\n", iter->trace->name);
  2929				seq_puts(m, "#\n");
  2930				test_ftrace_alive(m);
  2931			}
  2932			if (iter->snapshot && trace_empty(iter))
  2933				print_snapshot_help(m, iter);
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^
"iter->tr" gets dereferenced inside the new call to print_snapshot_help().

  2934			else if (iter->trace && iter->trace->print_header)
  2935				iter->trace->print_header(m);

regards,
dan carpenter
