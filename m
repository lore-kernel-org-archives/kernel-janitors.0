From: Shuah Khan <shuah@kernel.org>
Date: Thu, 13 Apr 2017 22:07:06 +0000
Subject: Re: [PATCH] selftests/timers: fix spelling mistake: "Asynchronous"
Message-Id: <5bbc5240-051f-4751-23cf-556d516cf588@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170412134817.17369-1-colin.king@canonical.com>
In-Reply-To: <20170412134817.17369-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>

On 04/12/2017 07:48 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> trivial fix to spelling mistake in printed message.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/testing/selftests/timers/clocksource-switch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/timers/clocksource-switch.c b/tools/testing/selftests/timers/clocksource-switch.c
> index fd88e3025bed..5ff165373f8b 100644
> --- a/tools/testing/selftests/timers/clocksource-switch.c
> +++ b/tools/testing/selftests/timers/clocksource-switch.c
> @@ -159,7 +159,7 @@ int main(int argv, char **argc)
>  	}
>  
>  
> -	printf("Running Asyncrhonous Switching Tests...\n");
> +	printf("Running Asynchronous Switching Tests...\n");
>  	pid = fork();
>  	if (!pid)
>  		return run_tests(60);
> 

Applied to linux-kselftest next

thanks,
-- Shuah
