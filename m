From: John Stultz <john.stultz@linaro.org>
Date: Sat, 22 Sep 2012 00:47:38 +0000
Subject: Re: [time:fortglx/3.7/time 11/13] include/linux/timekeeper_internal.h:101:1: sparse: missing identif
Message-Id: <505D0AAA.3070907@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120922004111.GH5959@localhost>
In-Reply-To: <20120922004111.GH5959@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 09/21/2012 05:41 PM, Fengguang Wu wrote:
> Hi John,
>
> FYI, there are new sparse warnings show up in
>
> tree:   git://git.linaro.org/people/jstultz/linux.git fortglx/3.7/time
> head:   f9bb3ff13c4701ee6242ec4b4ef0cbc71d5ff299
> commit: 672364f56055976aae7e68b59cf578173a3dbddc [11/13] time: Introduce new GENERIC_TIME_VSYSCALL
>
> All sparse warnings:
>
[snip]
>      98	#else
>      99	
>     100	static inline void update_vsyscall(struct timekeeper *tk);
>   > 101	{
>     102	}
>     103	static inline void update_vsyscall_tz(void)
>     104	{
>     105	}
>     106	#endif
>     107	
>     108	#endif /* _LINUX_TIMEKEEPER_INTERNAL_H */
>
I just caught this myself and have re-pushed out a fix to that tree.

Thanks again for the automated testing!
-john

