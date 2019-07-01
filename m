From: walter harms <wharms@bfs.de>
Date: Mon, 01 Jul 2019 13:12:46 +0000
Subject: Re: [PATCH][next] selftests/x86: fix spelling mistake "FAILT" -> "FAIL"
Message-Id: <5D1A06CE.6000405@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190701130431.13391-1-colin.king@canonical.com>
In-Reply-To: <20190701130431.13391-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Shuah Khan <shuah@kernel.org>, Andy Lutomirski <luto@kernel.org>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 01.07.2019 15:04, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an spelling mistake in an a test error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/testing/selftests/x86/test_vsyscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/x86/test_vsyscall.c b/tools/testing/selftests/x86/test_vsyscall.c
> index 4602326b8f5b..a4f4d4cf22c3 100644
> --- a/tools/testing/selftests/x86/test_vsyscall.c
> +++ b/tools/testing/selftests/x86/test_vsyscall.c
> @@ -451,7 +451,7 @@ static int test_vsys_x(void)
>  		printf("[OK]\tExecuting the vsyscall page failed: #PF(0x%lx)\n",
>  		       segv_err);
>  	} else {
> -		printf("[FAILT]\tExecution failed with the wrong error: #PF(0x%lx)\n",
> +		printf("[FAIL]\tExecution failed with the wrong error: #PF(0x%lx)\n",
>  		       segv_err);
>  		return 1;
>  	}


"wrong error" sounds like scratching table, perhaps "error" is here sufficient ?
Bomus points when user is expected to report this.

re,
 wh
