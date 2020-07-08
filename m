From: <dan.carpenter@oracle.com>
Date: Wed, 08 Jul 2020 11:44:53 +0000
Subject: [bug report] cpufreq: intel_pstate: Allow raw energy performance preference value
Message-Id: <20200708114453.GA11282@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Srinivas Pandruvada,

The patch f473bf398bf1: "cpufreq: intel_pstate: Allow raw energy
performance preference value" from Jun 26, 2020, leads to the
following static checker warning:

	drivers/cpufreq/intel_pstate.c:731 store_energy_performance_preference()
	error: uninitialized symbol 'epp'.

drivers/cpufreq/intel_pstate.c
   706  static ssize_t store_energy_performance_preference(
   707                  struct cpufreq_policy *policy, const char *buf, size_t count)
   708  {
   709          struct cpudata *cpu_data = all_cpu_data[policy->cpu];
   710          char str_preference[21];
   711          bool raw = false;
   712          u32 epp;
                    ^^^
   713          int ret;
   714  
   715          ret = sscanf(buf, "%20s", str_preference);
   716          if (ret != 1)
   717                  return -EINVAL;
   718  
   719          ret = match_string(energy_perf_strings, -1, str_preference);
   720          if (ret < 0) {
   721                  if (!boot_cpu_has(X86_FEATURE_HWP_EPP))
   722                          return ret;
   723  
   724                  ret = kstrtouint(buf, 10, &epp);
                                                  ^^^^

   725                  if (ret)
   726                          return ret;
   727  
   728                  raw = true;
   729          }
   730  
   731          ret = intel_pstate_set_energy_pref_index(cpu_data, ret, raw, epp);
                                                                             ^^^
This will cause a KASan warning at runtime as well as a static checker
warning.

   732          if (ret)
   733                  return ret;
   734  
   735          return count;
   736  }

regards,
dan carpenter
