From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 May 2014 20:22:55 +0000
Subject: Re: [PATCH 2/4] cpupower: Remove redundant error check
Message-Id: <20140517202255.GF15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400350980-30455-2-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1400350980-30455-2-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, Thomas Renninger <trenn@suse.de>, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Alan Cox <alan@linux.intel.com>, kernel-janitors@vger.kernel.org

On Sat, May 17, 2014 at 08:22:58PM +0200, Peter Senna Tschudin wrote:
> diff --git a/tools/power/cpupower/utils/cpufreq-set.c b/tools/power/cpupower/utils/cpufreq-set.c
> index a416de8..4e2f35a 100644
> --- a/tools/power/cpupower/utils/cpufreq-set.c
> +++ b/tools/power/cpupower/utils/cpufreq-set.c
> @@ -320,12 +320,11 @@ int cmd_freq_set(int argc, char **argv)
>  
>  		printf(_("Setting cpu: %d\n"), cpu);
>  		ret = do_one_cpu(cpu, &new_pol, freq, policychange);
> -		if (ret)
> +		if (ret) {
> +			print_error();
>  			break;

Just return directly instead of break return;

> +		}
>  	}
>  
> -	if (ret)
> -		print_error();
> -
>  	return ret;

Are you sure this patch is correct?  Theoretically, it's possible to
reach the end of this function without going hitting the
"ret = do_one_cpu(...);" assignment.

Don't be fooled by the "int ret = 0;" initialization, that is a trick
initialization to mislead the unwary.  By the end of the do while loop
then "ret" is always -1.

regards,
dan carpenter

