From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 22 Jan 2021 16:06:28 +0000
Subject: Re: [PATCH] cpufreq: intel_pstate: Remove repeated word
Message-Id: <CAJZ5v0h7VN9-uKZPPBJ3wuRRLJpCN5EjLKFM++DcCi3fU2zwzw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210117004705.GA10789@fedora>
In-Reply-To: <20210117004705.GA10789@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Christian <nigel.l.christian@gmail.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Jan 17, 2021 at 1:48 AM Nigel Christian
<nigel.l.christian@gmail.com> wrote:
>
> In the comment for trace in passive mode there is an
> unnecessary "the". Eradicate it.
>
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/cpufreq/intel_pstate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index 6f2ff2775664..5175ae3cac44 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -2498,7 +2498,7 @@ static int intel_cpufreq_verify_policy(struct cpufreq_policy_data *policy)
>   * driver call was via the normal or fast switch path. Various graphs
>   * output from the intel_pstate_tracer.py utility that include core_busy
>   * (or performance or core_avg_perf) have a fixed y-axis from 0 to 100%,
> - * so we use 10 to indicate the the normal path through the driver, and
> + * so we use 10 to indicate the normal path through the driver, and
>   * 90 to indicate the fast switch path through the driver.
>   * The scaled_busy field is not used, and is set to 0.
>   */
> --

Applied as 5.12 material, thanks!
