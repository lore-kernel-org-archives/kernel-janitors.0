From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 07 Jan 2021 16:39:24 +0000
Subject: Re: [PATCH][V3] cpufreq: powernow-k8: pass policy rather than use cpufreq_cpu_get
Message-Id: <CAJZ5v0gF9XRNnn+O+kCRFtas9sgrQgk8piF1OoHqmGhi66qZwg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210105101957.59072-1-colin.king@canonical.com> <20210105102101.y4jdqdmcru5ouec4@vireshk-i7>
In-Reply-To: <20210105102101.y4jdqdmcru5ouec4@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>, Colin King <colin.king@canonical.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Stephen Warren <swarren@nvidia.com>, Linux PM <linux-pm@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jan 5, 2021 at 11:22 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-01-21, 10:19, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently there is an unlikely case where cpufreq_cpu_get returns a
> > null policy and this will cause a null pointer dereference later on.
> > Fix this by passing the policy to transition_frequency_fidvid from the
> > caller and hence eliminating the need for the cpufreq_cpu_get and
> > cpufreq_cpu_put.  Thanks to Viresh Kumar for suggesting the fix.
> >
> > Addresses-Coverity: ("Dereference null return")
> > Fixes: b43a7ffbf33b ("cpufreq: Notify all policy->cpus in cpufreq_notify_transition()")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >
> > V2: pass the policy to transition_frequency_fidvid rather than add
> >     a null pointer check on the return from a cpufreq_cpu_get call.
> > V3: update subject line to match the fix
> >
> > ---
> >  drivers/cpufreq/powernow-k8.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 5.11-rc material, thanks!
