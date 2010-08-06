From: Tejun Heo <tj@kernel.org>
Date: Fri, 06 Aug 2010 12:57:10 +0000
Subject: Re: [PATCH] percpu: remove address_space attribute if !SMP
Message-Id: <4C5C06A6.7070206@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281098768-5724-1-git-send-email-namhyung@gmail.com>	 <4C5C04D8.1080103@kernel.org> <1281099197.1655.11.camel@leonhard>
In-Reply-To: <1281099197.1655.11.camel@leonhard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Namhyung Kim <namhyung@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello,

On 08/06/2010 02:53 PM, Namhyung Kim wrote:
>> But they should still be accessed through the accessors and if they
>> are accessed through accessors, there shouldn't be sparse warnings
>> regarding them.  Maybe UP accessors are missing proper markups?  Do
>> those warnings only happen on UP config?
>>
> 
> They do nothing on UP.
> quoting from include/asm-generic.h:
> 
> #else /* ! SMP */
> 
> #define per_cpu(var, cpu)			(*((void)(cpu), &(var)))
> #define __get_cpu_var(var)			(var)
> #define __raw_get_cpu_var(var)			(var)
> #define this_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
> #define __this_cpu_ptr(ptr) this_cpu_ptr(ptr)
> 
> #endif	/* SMP */

Ah, I see.  Then, the right thing to do is to add proper checking and
markups to UP accessors matching the SMP ones.
ie. __verify_pcpu_ptr() verification followed by __kernel __force
casting.  Are you interested in doing it?

Thanks.

-- 
tejun
