From: Michal Marek <mmarek@suse.cz>
Date: Thu, 12 May 2011 20:30:29 +0000
Subject: Re: [Resend PATCH] package: Makefile: fix perf target bug
Message-Id: <4DCC4365.3030907@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>
In-Reply-To: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mfmooney@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12.5.2011 20:25, mfmooney@gmail.com wrote:
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 1b7eaea..a32dc2d 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -118,10 +118,14 @@ perf-tar=perf-$(KERNELVERSION)
>  
>  quiet_cmd_perf_tar = TAR
>        cmd_perf_tar = \
> -git archive --prefix=$(perf-tar)/ HEAD^{tree}                       \
> -	$$(cat $(srctree)/tools/perf/MANIFEST) -o $(perf-tar).tar;  \
> +git --git-dir=$(srctree)/.git --work-tree=$(srctree)                \

Neither git archive not git rev-parse need the work tree, --git-dir=..
is sufficient.

Michal

> +	archive --prefix=$(perf-tar)/ HEAD^{tree}                   \
> +	$(addprefix $(srctree)/,                                    \
> +	  $(shell cat $(srctree)/tools/perf/MANIFEST))              \
> +	-o $(perf-tar).tar;                                         \
>  mkdir -p $(perf-tar);                                               \
> -git rev-parse HEAD > $(perf-tar)/HEAD;                              \
> +git --git-dir=$(srctree)/.git --work-tree=$(srctree)                \
> +	rev-parse HEAD > $(perf-tar)/HEAD;                          \
>  tar rf $(perf-tar).tar $(perf-tar)/HEAD;                            \
>  rm -r $(perf-tar);                                                  \
>  $(if $(findstring tar-src,$@),,                                     \

