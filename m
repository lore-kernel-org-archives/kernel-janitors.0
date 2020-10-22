From: Giovanni Gherdovich <ggherdovich@suse.com>
Date: Thu, 22 Oct 2020 20:10:35 +0000
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-Id: <1603397435.16275.45.camel@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
         <34115486.YmRjPRKJaA@kreacher>
         <20201022120213.GG2611@hirez.programming.kicks-ass.net>
         <1790766.jaFeG3T87Z@kreacher>
         <20201022122949.GW2628@hirez.programming.kicks-ass.net>
         <20201022145250.GK32041@suse.de>
         <20201022152514.GJ2611@hirez.programming.kicks-ass.net>
In-Reply-To: <20201022152514.GJ2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Mel Gorman <mgorman@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com, Linux PM <linux-pm@vger.kernel.org>, Len Brown <len.brown@intel.com>

Hello Peter, Rafael,

back in August I tested a v5.8 kernel adding Rafael's patches from v5.9 that
make schedutil and HWP works together, i.e. f6ebbcf08f37 ("cpufreq: intel_pstate:
Implement passive mode with HWP enabled").

The main point I took from the exercise is that tbench (network benchmark
in localhost) is problematic for schedutil and only with HWP (thanks to
Rafael's patch above) it reaches the throughput of the other governors.
When HWP isn't available, the penalty is 5-10% and I need to understand if
the cause is something that can affect other applications too (or just a
quirk of this test).

I ran this campaign this summer when Rafal CC'ed me to f6ebbcf08f37
("cpufreq: intel_pstate: Implement passive mode with HWP enabled"),
I didn't reply as the patch was a win anyways (my bad, I should have posted
the positive results). The regression of tbench with schedutil w/o HWP,
that went unnoticed for long, got the best of my attention.

Other remarks

* on gitsource (running the git unit test suite, measures elapsed time)
  schedutil is a lot better than Intel's powersave but not as good as the
  performance governor.

* for the AMD EPYC machines we haven't yet implemented frequency invariant
  accounting, which might explain why schedutil looses to ondemand on all
  the benchmarks.

* on dbench (filesystem, measures latency) and kernbench (kernel compilation),
  sugov is as good as the Intel performance governor. You can add or remove
  HWP (to either sugov or perfgov), it doesn't make a difference. Intel's
  powersave in general trails behind.

* generally my main concern is performance, not power efficiency, but I was
  a little disappointed to see schedutil being just as efficient as
  perfgov (the performance-per-watt ratios): there are even a few cases
  where (on tbench) the performance governor is both faster and more
  efficient. From previous conversations with Rafael I recall that
  switching frequency has an energy cost, so it could be that schedutil
  switches too often to amortize it. I haven't checked.

To read the tables:

Tilde (~) means the result is the same as baseline (or, the ratio is close
to 1). The double asterisk (**) is a visual aid and means the result is
worse than baseline (higher or lower depending on the case).

For an overview of the possible configurations (intel_psate passive,
active, HWP on/off etc) I made the diagram at
https://beta.suse.com/private/ggherdovich/cpufreq/x86-cpufreq.png

1) INTEL, HWP-CAPABLE MACHINES
2) INTEL, NON-HWP-CAPABLE MACHINES
3) AMD EPYC

1) INTEL, HWP-CAPABLE MACHINES:

64x_SKYLAKE_NUMA: Intel Skylake SP, 32 cores / 64 threads, NUMA, SATA SSD storage
------------------------------------------------------------------------------
            sugov-HWP   sugov-no-HWP   powersave-HWP   perfgov-HWP   better if
------------------------------------------------------------------------------
                                  PERFORMANCE RATIOS
tbench        1.00        0.68           ~               1.03**        higher
dbench        1.00        ~              1.03            ~             lower
kernbench     1.00        ~              1.11            ~             lower
gitsource     1.00        1.03           2.26            0.82**        lower
------------------------------------------------------------------------------
                             PERFORMANCE-PER-WATT RATIOS
tbench        1.00        0.74           ~               ~             higher
dbench        1.00        ~              ~               ~             higher
kernbench     1.00        ~              0.96            ~             higher
gitsource     1.00        0.96           0.45            1.15**        higher


8x_SKYLAKE_UMA: Intel Skylake (client), 4 cores / 8 threads, UMA, SATA SSD storage
------------------------------------------------------------------------------
            sugov-HWP   sugov-no-HWP   powersave-HWP   perfgov-HWP   better if
------------------------------------------------------------------------------
                                  PERFORMANCE RATIOS
tbench        1.00        0.91           ~               ~             higher
dbench        1.00        ~              ~               ~             lower
kernbench     1.00        ~              ~               ~             lower
gitsource     1.00        1.04           1.77            ~             lower
------------------------------------------------------------------------------
                             PERFORMANCE-PER-WATT RATIOS
tbench        1.00        0.95           ~               ~             higher
dbench        1.00        ~              ~               ~             higher
kernbench     1.00        ~              ~               ~             higher
gitsource     1.00        ~              0.74            ~             higher


8x_COFFEELAKE_UMA: Intel Coffee Lake, 4 cores / 8 threads, UMA, NVMe SSD storage
---------------------------------------------------------------
            sugov-HWP   powersave-HWP   perfgov-HWP   better if
---------------------------------------------------------------
                        PERFORMANCE RATIOS
tbench        1.00        ~               ~             higher
dbench        1.00        1.12            ~             lower
kernbench     1.00        ~               ~             lower
gitsource     1.00        2.05            ~             lower
---------------------------------------------------------------
                    PERFORMANCE-PER-WATT RATIOS
tbench        1.00        ~               ~             higher
dbench        1.00        1.80**          ~             higher
kernbench     1.00        ~               ~             higher
gitsource     1.00        1.52**          ~             higher


2) INTEL, NON-HWP-CAPABLE MACHINES:

80x_BROADWELL_NUMA: Intel Broadwell EP, 40 cores / 80 threads, NUMA, SATA SSD storage
---------------------------------------------------------------
              sugov     powersave       perfgov       better if
---------------------------------------------------------------
                        PERFORMANCE RATIOS
tbench        1.00        1.11**          1.10**        higher
dbench        1.00        1.10            ~             lower
kernbench     1.00        1.10            ~             lower
gitsource     1.00        2.27            0.95**        lower
---------------------------------------------------------------
                    PERFORMANCE-PER-WATT RATIOS
tbench        1.00         1.05**         1.04**        higher
dbench        1.00         1.24**         0.95          higher
kernbench     1.00         ~              ~             higher
gitsource     1.00         0.86           1.04**        higher


48x_HASWELL_NUMA: Intel Haswell EP, 24 cores / 48 threads, NUMA, HDD storage
---------------------------------------------------------------
              sugov     powersave       perfgov       better if
---------------------------------------------------------------
                        PERFORMANCE RATIOS
tbench        1.00         1.25**         1.27**        higher
dbench        1.00         1.17           ~             lower
kernbench     1.00         1.04           ~             lower
gitsource     1.00         1.54           0.79**        lower
---------------------------------------------------------------
                    PERFORMANCE-PER-WATT RATIOS
tbench        1.00         1.18**         1.11**        higher
dbench        1.00         1.25**         ~             higher
kernbench     1.00         1.04**         0.97          higher
gitsource     1.00         0.77           ~             higher


3) AMD EPYC:

256x_ROME_NUMA: AMD Rome , 128 cores / 256 threads, NUMA, SATA SSD storage
---------------------------------------------------------------
              sugov      ondemand       perfgov       better if
---------------------------------------------------------------
                        PERFORMANCE RATIOS
tbench        1.00         1.11**       1.58**          higher
dbench        1.00         0.44**       0.40**          lower
kernbench     1.00         ~            0.91**          lower
gitsource     1.00         0.96**       0.65**          lower


128x_NAPLES_NUMA: AMD Naples , 64 cores / 128 threads, NUMA, SATA SSD storage
---------------------------------------------------------------
              sugov      ondemand       perfgov       better if
---------------------------------------------------------------
                        PERFORMANCE RATIOS
tbench        1.00         1.10**       1.19**          higher
dbench        1.00         1.05         0.95**          lower
kernbench     1.00         ~            0.95**          lower
gitsource     1.00         0.93**       0.55**          lower


Giovanni
