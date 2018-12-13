From: shuah <shuah@kernel.org>
Date: Thu, 13 Dec 2018 14:24:51 +0000
Subject: Re: [PATCH][next] selftests: watchdog: fix spelling mistake "experies" -> "expires"
Message-Id: <32532eac-969a-83e2-4373-fdbef613ce33@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181213094015.31397-1-colin.king@canonical.com>
In-Reply-To: <20181213094015.31397-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/13/18 2:40 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the --gettimeleft help text, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   tools/testing/selftests/watchdog/watchdog-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
> index dac907a932ce..c2333c78cf04 100644
> --- a/tools/testing/selftests/watchdog/watchdog-test.c
> +++ b/tools/testing/selftests/watchdog/watchdog-test.c
> @@ -78,7 +78,7 @@ static void usage(char *progname)
>   	printf(" -T, --gettimeout    Get the timeout\n");
>   	printf(" -n, --pretimeout=T  Set the pretimeout to T seconds\n");
>   	printf(" -N, --getpretimeout Get the pretimeout\n");
> -	printf(" -L, --gettimeleft   Get the time left until timer experies\n");
> +	printf(" -L, --gettimeleft   Get the time left until timer expires\n");
>   	printf("\n");
>   	printf("Parameters are parsed left-to-right in real-time.\n");
>   	printf("Example: %s -d -t 10 -p 5 -e\n", progname);
> 

That is quick! Thanks for the patch. I will apply it to linuxk-kselftest 
next

thanks,
-- Shuah
