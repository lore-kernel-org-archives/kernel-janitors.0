From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 16 Feb 2009 12:59:28 +0000
Subject: Re: [PATCH] trace: Storage class should be before const qualifier
Message-Id: <alpine.LNX.1.10.0902161358540.18110@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090209220932.GA8220@xenon.distanz.ch>
In-Reply-To: <20090209220932.GA8220@xenon.distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 9 Feb 2009, Tobias Klauser wrote:

> The C99 specification states in section 6.11.5:
> 
> The placement of a storage-class specifier other than at the beginning
> of the declaration specifiers in a declaration is an obsolescent
> feature.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  kernel/trace/trace_sysprof.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/kernel/trace/trace_sysprof.c b/kernel/trace/trace_sysprof.c
> index eaca5ad..1883221 100644
> --- a/kernel/trace/trace_sysprof.c
> +++ b/kernel/trace/trace_sysprof.c
> @@ -88,7 +88,7 @@ static void backtrace_address(void *data, unsigned long addr, int reliable)
>  	}
>  }
>  
> -const static struct stacktrace_ops backtrace_ops = {
> +static const struct stacktrace_ops backtrace_ops = {
>  	.warning		= backtrace_warning,
>  	.warning_symbol		= backtrace_warning_symbol,
>  	.stack			= backtrace_stack,

Steven, are you going to take this through wusb tree, or should I take it 
through trivial tree together with the rest of these patches? I don't seem 
to see this present in current -next.

Thanks,

-- 
Jiri Kosina
SUSE Labs
