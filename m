From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Feb 2020 10:58:16 +0000
Subject: [bug report] x86/intel_pstate: Handle runtime turbo disablement/enablement in frequency invariance
Message-Id: <20200203105816.4tplbgmyr6wmunou@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Giovanni Gherdovich,

The patch 918229cdd5ab: "x86/intel_pstate: Handle runtime turbo
disablement/enablement in frequency invariance" from Jan 22, 2020,
leads to the following static checker warning:

	arch/x86/kernel/smpboot.c:1988 intel_set_max_freq_ratio()
	error: uninitialized symbol 'turbo_freq'.

arch/x86/kernel/smpboot.c
  1964  static bool intel_set_max_freq_ratio(void)
  1965  {
  1966          u64 base_freq, turbo_freq;
  1967  
  1968          if (slv_set_max_freq_ratio(&base_freq, &turbo_freq))
  1969                  goto out;
  1970  
  1971          if (x86_match_cpu(has_glm_turbo_ratio_limits) &&
  1972              skx_set_max_freq_ratio(&base_freq, &turbo_freq, 1))
  1973                  goto out;
  1974  
  1975          if (knl_set_max_freq_ratio(&base_freq, &turbo_freq, 1))
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The last return here should be "false" instead of "true".  Otherwise we
use "turbo_freq" without initializing it.

  1976                  goto out;
  1977  
  1978          if (x86_match_cpu(has_skx_turbo_ratio_limits) &&
  1979              skx_set_max_freq_ratio(&base_freq, &turbo_freq, 4))
  1980                  goto out;
  1981  
  1982          if (core_set_max_freq_ratio(&base_freq, &turbo_freq))
  1983                  goto out;
  1984  
  1985          return false;
  1986  
  1987  out:
  1988          arch_turbo_freq_ratio = div_u64(turbo_freq * SCHED_CAPACITY_SCALE,
  1989                                          base_freq);
  1990          arch_set_max_freq_ratio(turbo_disabled());
  1991          return true;
  1992  }

regards,
dan carpenter
