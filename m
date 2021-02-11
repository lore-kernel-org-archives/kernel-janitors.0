From: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 11 Feb 2021 16:39:12 +0000
Subject: Re: [PATCH] doc/admin-guide: fix spelling mistake: "perfomance" -> "performance"
Message-Id: <875z2yr233.fsf@meer.lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210210115624.53551-1-colin.king@canonical.com>
In-Reply-To: <20210210115624.53551-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Alexey Budankov <alexey.budankov@linux.intel.com>, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the perf-security documentation. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  Documentation/admin-guide/perf-security.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/perf-security.rst b/Documentation/admin-guide/perf-security.rst
> index 904e4eb37f99..34aa334320ca 100644
> --- a/Documentation/admin-guide/perf-security.rst
> +++ b/Documentation/admin-guide/perf-security.rst
> @@ -72,7 +72,7 @@ monitoring and observability operations, thus, bypass *scope* permissions
>  checks in the kernel. CAP_PERFMON implements the principle of least
>  privilege [13]_ (POSIX 1003.1e: 2.2.2.39) for performance monitoring and
>  observability operations in the kernel and provides a secure approach to
> -perfomance monitoring and observability in the system.
> +performance monitoring and observability in the system.

Applied, thanks.

jon
