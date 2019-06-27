From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Jun 2019 07:15:21 +0000
Subject: [bug report] lib/vdso: Provide generic VDSO implementation
Message-Id: <20190627071521.GA22903@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Vincenzo Frascino,

This is a semi-automatic email about new static checker warnings.

The patch 00b26474c2f1: "lib/vdso: Provide generic VDSO
implementation" from Jun 21, 2019, leads to the following Smatch
complaint:

    arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:120 __cvdso_clock_gettime32()
    error: we previously assumed 'res' could be null (see line 107)

lib/vdso/gettimeofday.c
   101  static __maybe_unused int
   102  __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
   103  {
   104          struct __kernel_timespec ts;
   105          int ret;
   106	
   107		if (res = NULL)
                    ^^^^^^^^^^^
   108			goto fallback;
   109	
   110		ret = __cvdso_clock_gettime(clock, &ts);
   111	
   112		if (ret = 0) {
   113			res->tv_sec = ts.tv_sec;
   114			res->tv_nsec = ts.tv_nsec;
   115		}
   116	
   117		return ret;
   118	
   119	fallback:
   120		return clock_gettime_fallback(clock, (struct __kernel_timespec *)res);
                                                                                 ^^^
On x86 this "res" always gets dereferenced.

   121	}

regards,
dan carpenter
