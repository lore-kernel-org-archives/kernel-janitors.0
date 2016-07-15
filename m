From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Fri, 15 Jul 2016 22:27:49 +0000
Subject: Re: [patch 1/2] perf jit: add missing curly braces
Message-Id: <20160715222749.GG8740@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715210712.GA19522@mwanda>
 <20160715222556.GE8740@kernel.org>
In-Reply-To: <20160715222556.GE8740@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Stephane Eranian <eranian@google.com>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Em Fri, Jul 15, 2016 at 07:25:56PM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Sat, Jul 16, 2016 at 12:07:12AM +0300, Dan Carpenter escreveu:
> > It doesn't change the runtime behavior, but my static checker complains
> > that curly braces were intended.
> 
> Agreed, applying, thanks!

After fixing this:

[acme@jouet linux]$ am /wb/1.patch 
Applying: perf jit: add missing curly braces
fatal: patch with only garbage at line 3
Patch failed at 0001 perf jit: add missing curly braces
 
> - Arnaldo
>  
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/tools/perf/jvmti/jvmti_agent.c b/tools/perf/jvmti/jvmti_agent.c
> > index 3573f31..91bf333 100644
> > --- a/tools/perf/jvmti/jvmti_agent.c
> > +++ b/tools/perf/jvmti/jvmti_agent.c
> > @@ -491,10 +491,11 @@ jvmti_write_debug_info(void *agent, uint64_t code, const char *file,
> >  		if (sret != 1)
> >  			goto error;
> >  	}
> > -	if (padding_count)
> > +	if (padding_count) {
> >  		sret = fwrite_unlocked(pad_bytes, padding_count, 1, fp);
> >  		if (sret != 1)
> >  			goto error;
> > +	}
> >  
> >  	funlockfile(fp);
> >  	return 0;
