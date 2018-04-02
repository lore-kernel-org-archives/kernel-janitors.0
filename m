From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 02 Apr 2018 15:52:32 +0000
Subject: Re: [PATCH] tracing: Uninitialized variable in create_tracing_map_fields()
Message-Id: <20180402115232.2319bcef@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180328114815.GC29050@mwanda>
        <1522245880.520.1.camel@tzanussi-mobl.amr.corp.intel.com>
In-Reply-To: <1522245880.520.1.camel@tzanussi-mobl.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 28 Mar 2018 09:04:40 -0500
Tom Zanussi <tom.zanussi@linux.intel.com> wrote:

> Yes, this should definitely be initialized to 0, thanks for the patch!
> 
> Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>

Thanks, I applied it and will push to git after it has succeeded in
testing.

-- Steve
