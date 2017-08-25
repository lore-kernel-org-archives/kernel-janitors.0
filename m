From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 25 Aug 2017 18:13:49 +0000
Subject: Re: [PATCH] x86/platform/intel-mid: make several arrays static, makes code smaller
Message-Id: <aaef84f8-e047-8d35-6702-3cc3c7a1f039@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825163206.23250-1-colin.king@canonical.com>
 <20170825175104.GA19150@wunner.de>
 <1503683627.25945.114.camel@linux.intel.com>
In-Reply-To: <1503683627.25945.114.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Bjorn Helgaas <bhelgaas@google.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 25/08/17 18:53, Andy Shevchenko wrote:
> On Fri, 2017-08-25 at 19:51 +0200, Lukas Wunner wrote:
>> On Fri, Aug 25, 2017 at 05:32:06PM +0100, Colin King wrote:
>>> --- a/arch/x86/platform/intel-mid/pwr.c
>>> +++ b/arch/x86/platform/intel-mid/pwr.c
>>> @@ -444,7 +444,7 @@ static int mid_set_initial_state(struct mid_pwr
>>> *pwr, const u32 *states)
>>>  static int pnw_set_initial_state(struct mid_pwr *pwr)
>>>  {
>>>  	/* On Penwell SRAM must stay powered on */
>>> -	const u32 states[] = {
>>> +	static const u32 states[] = {
>>>  		0xf00fffff,		/* PM_SSC(0) */
>>>  		0xffffffff,		/* PM_SSC(1) */
>>>  		0xffffffff,		/* PM_SSC(2) */
>>
>> That's a known gcc bug:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?idh725
>>
>> There are hundreds of constant compound literals that are generated
>> on the stack rather than stored in rodata, do you intend to file
>> patches for all of them?  Adding static everywhere is just a
>> workaround that bloats the code.  Fixing the root cause in gcc would
>> make more sense.

Hrm.  constifying will specify it won't be changed; section A8.2 of "The
C programming language" 2nd edition states that this specifier "is to
announce that objects may be placed in read-only memory, and perhaps
increase opportunities for optimization".  Emphasis on "may", it can do,
but it does not necessarily have to. The static storage class specifier
will ensure the object is not on the stack for sure.  So I think from my
understanding of the semantics described in K&R 2nd edition:

const - data is read only, and can be put into read-only location if
compiler can (or wants) to do so
static - data will be not stashed on the stack.

So my change is to be totally clear on the intent - make it read only
and ensure it is not populated at run time on the stack.

Colin

> 
> That is a good point.
> 

