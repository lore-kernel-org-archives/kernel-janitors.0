From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 15 Jun 2020 15:10:46 +0000
Subject: Re: [PATCH] tracing/probe: fix memleak in fetch_op_data operations
Message-Id: <89f42852-80ef-1634-68fe-b7f686f8ce59@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>, Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

…
> Post parse_probe_arg(), the FETCH_OP_DATA operation type is overwritten
> to FETCH_OP_ST_STRING, as a result memory is never freed …

How do you think about to use the term “memory leak” in the patch subject?

Will the tag “Fixes” become helpful for the commit message?

Regards,
Markus
