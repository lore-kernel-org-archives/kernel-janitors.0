From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 05 Jan 2021 10:33:01 +0000
Subject: Re: [PATCH][V3] cpufreq: powernow-k8: pass policy rather than use cpufreq_cpu_get
Message-Id: <20210105102101.y4jdqdmcru5ouec4@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210105101957.59072-1-colin.king@canonical.com>
In-Reply-To: <20210105101957.59072-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Stephen Warren <swarren@nvidia.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05-01-21, 10:19, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently there is an unlikely case where cpufreq_cpu_get returns a
> null policy and this will cause a null pointer dereference later on.
> Fix this by passing the policy to transition_frequency_fidvid from the
> caller and hence eliminating the need for the cpufreq_cpu_get and
> cpufreq_cpu_put.  Thanks to Viresh Kumar for suggesting the fix.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: b43a7ffbf33b ("cpufreq: Notify all policy->cpus in cpufreq_notify_transition()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: pass the policy to transition_frequency_fidvid rather than add
>     a null pointer check on the return from a cpufreq_cpu_get call.
> V3: update subject line to match the fix
> 
> ---
>  drivers/cpufreq/powernow-k8.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
