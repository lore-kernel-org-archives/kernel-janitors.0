From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Date: Thu, 27 Jun 2019 08:58:18 +0000
Subject: Re: [bug report] lib/vdso: Provide generic VDSO implementation
Message-Id: <c23609d4-2aff-bc5e-afdf-53a4824a2ef7@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627071521.GA22903@mwanda>
In-Reply-To: <20190627071521.GA22903@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

thank you for testing my patches.

On 6/27/19 8:15 AM, Dan Carpenter wrote:
> Hello Vincenzo Frascino,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 00b26474c2f1: "lib/vdso: Provide generic VDSO
> implementation" from Jun 21, 2019, leads to the following Smatch
> complaint:
> 
>     arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:120 __cvdso_clock_gettime32()
>     error: we previously assumed 'res' could be null (see line 107)
> 
> lib/vdso/gettimeofday.c
>    101  static __maybe_unused int
>    102  __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
>    103  {
>    104          struct __kernel_timespec ts;
>    105          int ret;
>    106	
>    107		if (res = NULL)
>                     ^^^^^^^^^^^
>    108			goto fallback;
>    109	
>    110		ret = __cvdso_clock_gettime(clock, &ts);
>    111	
>    112		if (ret = 0) {
>    113			res->tv_sec = ts.tv_sec;
>    114			res->tv_nsec = ts.tv_nsec;
>    115		}
>    116	
>    117		return ret;
>    118	
>    119	fallback:
>    120		return clock_gettime_fallback(clock, (struct __kernel_timespec *)res);
>                                                                                  ^^^
> On x86 this "res" always gets dereferenced.
> 
>    121	}
> 

I am not sure I understand the details of this bug report. As far as I can see
"res" is never dereferenced in the vDSO library in this case, but it is passed
to the system call unchanged.

static __always_inline
long clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
{
	long ret;

	asm ("syscall" : "=a" (ret), "=m" (*_ts) :
	     "0" (__NR_clock_gettime), "D" (_clkid), "S" (_ts) :
	     "rcx", "r11");

	return ret;
}

This is done to maintain consistency in between the returned error code of the
syscall and of the vDSO library.

Could you please elaborate on why this bug has been reported?

> regards,
> dan carpenter
> 

-- 
Regards,
Vincenzo
