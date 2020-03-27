From: Kees Cook <keescook@chromium.org>
Date: Fri, 27 Mar 2020 19:02:25 +0000
Subject: Re: [PATCH][next] selftests/harness: fix spelling mistake "SIGARLM" -> "SIGALRM"
Message-Id: <202003271202.123FD50@keescook>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200327090648.13387-1-colin.king@canonical.com>
In-Reply-To: <20200327090648.13387-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 27, 2020 at 09:06:48AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There a few identical spelling mistakes, fix these.

Argh, thanks Colin!

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/testing/selftests/kselftest_harness.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index 2902f6a78f8a..2bb8c81fc0b4 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -705,7 +705,7 @@ static void __timeout_handler(int sig, siginfo_t *info, void *ucontext)
>  	/* Sanity check handler execution environment. */
>  	if (!t) {
>  		fprintf(TH_LOG_STREAM,
> -			"no active test in SIGARLM handler!?\n");
> +			"no active test in SIGALRM handler!?\n");
>  		abort();
>  	}
>  	if (sig != SIGALRM || sig != info->si_signo) {
> @@ -731,7 +731,7 @@ void __wait_for_test(struct __test_metadata *t)
>  	if (sigaction(SIGALRM, &action, &saved_action)) {
>  		t->passed = 0;
>  		fprintf(TH_LOG_STREAM,
> -			"%s: unable to install SIGARLM handler\n",
> +			"%s: unable to install SIGALRM handler\n",
>  			t->name);
>  		return;
>  	}
> @@ -743,7 +743,7 @@ void __wait_for_test(struct __test_metadata *t)
>  	if (sigaction(SIGALRM, &saved_action, NULL)) {
>  		t->passed = 0;
>  		fprintf(TH_LOG_STREAM,
> -			"%s: unable to uninstall SIGARLM handler\n",
> +			"%s: unable to uninstall SIGALRM handler\n",
>  			t->name);
>  		return;
>  	}
> -- 
> 2.25.1
> 

-- 
Kees Cook
