From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 04 Mar 2017 12:01:03 +0000
Subject: [bug report] tools/power turbostat: decode MSR_MISC_FEATURE_CONTROL
Message-Id: <20170304120103.GA3292@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Len Brown,

The patch 33148d671cc1: "tools/power turbostat: decode
MSR_MISC_FEATURE_CONTROL" from Jan 21, 2017, leads to the following
static checker warning:

	tools/power/x86/turbostat/turbostat.c:3918 decode_misc_feature_control()
	warn: bitwise AND condition is false here

tools/power/x86/turbostat/turbostat.c
  3908  void decode_misc_feature_control(void)
  3909  {
  3910          unsigned long long msr;
  3911  
  3912          if (!has_misc_feature_control)
  3913                  return;
  3914  
  3915          if (!get_msr(base_cpu, MSR_MISC_FEATURE_CONTROL, &msr))
  3916                  fprintf(outf, "cpu%d: MSR_MISC_FEATURE_CONTROL: 0x%08llx (%sL2-Prefetch %sL2-Prefetch-pair %sL1-Prefetch %sL1-IP-Prefetch)\n",
  3917                          base_cpu, msr,
  3918                          msr & (0 << 0) ? "No-" : "",
                                ^^^^^^^^^^^^^
Never true.

  3919                          msr & (1 << 0) ? "No-" : "",
  3920                          msr & (2 << 0) ? "No-" : "",
  3921                          msr & (3 << 0) ? "No-" : "");

Was this supposed to be 1 << 0, 1 << 2 etc?

  3922  }

regards,
dan carpenter
