From: Shuah Khan <shuah@kernel.org>
Date: Fri, 04 May 2018 19:43:56 +0000
Subject: Re: [PATCH] cpupower: fix spelling mistake: "logilename" -> "logfilename"
Message-Id: <f176fe63-b697-aac7-6906-1e074056f793@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180503090910.29144-1-colin.king@canonical.com>
In-Reply-To: <20180503090910.29144-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Thomas Renninger <trenn@suse.com>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>

On 05/03/2018 03:09 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in dprintf message
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/power/cpupower/bench/parse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/power/cpupower/bench/parse.c b/tools/power/cpupower/bench/parse.c
> index 9b65f052081f..9ba8a44ad2a7 100644
> --- a/tools/power/cpupower/bench/parse.c
> +++ b/tools/power/cpupower/bench/parse.c
> @@ -104,7 +104,7 @@ FILE *prepare_output(const char *dirname)
>  			dirname, time(NULL));
>  	}
>  
> -	dprintf("logilename: %s\n", filename);
> +	dprintf("logfilename: %s\n", filename);
>  
>  	output = fopen(filename, "w+");
>  	if (output = NULL) {
> 

Thanks. I will send this for 4.18-rc1

-- Shuah
