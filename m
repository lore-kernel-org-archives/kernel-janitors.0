From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Thu, 22 Oct 2020 16:23:03 +0000
Subject: [PATCH] cpufreq: Avoid configuring old governors as default with intel_pstate
Message-Id: <8312288.dAKoTdFk2S@kreacher>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr> <34115486.YmRjPRKJaA@kreacher> <20201022120213.GG2611@hirez.programming.kicks-ass.net>
In-Reply-To: <20201022120213.GG2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>
Cc: Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com, Linux PM <linux-pm@vger.kernel.org>, Len Brown <len.brown@intel.com>

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Subject: [PATCH] cpufreq: Avoid configuring old governors as default with intel_pstate

Commit 33aa46f252c7 ("cpufreq: intel_pstate: Use passive mode by
default without HWP") was meant to cause intel_pstate without HWP
to be used in the passive mode with the schedutil governor on top of
it by default, but it missed the case in which either "ondemand" or
"conservative" was selected as the default governor in the existing
kernel config, in which case the previous old governor configuration
would be used, causing the default legacy governor to be used on top
of intel_pstate instead of schedutil.

Address this by preventing "ondemand" and "conservative" from being
configured as the default cpufreq governor in the case when schedutil
is the default choice for the default governor setting.

[Note that the default cpufreq governor can still be set via the
 kernel command line if need be and that choice is not limited,
 so if anyone really wants to use one of the legacy governors by
 default, it can be achieved this way.]

Fixes: 33aa46f252c7 ("cpufreq: intel_pstate: Use passive mode by default without HWP")
Cc: 5.8+ <stable@vger.kernel.org> # 5.8+
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/cpufreq/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

Index: linux-pm/drivers/cpufreq/Kconfig
=================================--- linux-pm.orig/drivers/cpufreq/Kconfig
+++ linux-pm/drivers/cpufreq/Kconfig
@@ -71,6 +71,7 @@ config CPU_FREQ_DEFAULT_GOV_USERSPACE
 
 config CPU_FREQ_DEFAULT_GOV_ONDEMAND
 	bool "ondemand"
+	depends on !SMP || !X86_INTEL_PSTATE
 	select CPU_FREQ_GOV_ONDEMAND
 	select CPU_FREQ_GOV_PERFORMANCE
 	help
@@ -83,6 +84,7 @@ config CPU_FREQ_DEFAULT_GOV_ONDEMAND
 
 config CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
 	bool "conservative"
+	depends on !SMP || !X86_INTEL_PSTATE
 	select CPU_FREQ_GOV_CONSERVATIVE
 	select CPU_FREQ_GOV_PERFORMANCE
 	help
