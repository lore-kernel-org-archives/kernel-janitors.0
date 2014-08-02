From: "Li, Aubrey" <aubrey.li@linux.intel.com>
Date: Sat, 02 Aug 2014 14:56:07 +0000
Subject: Re: [patch] x86/pmc_atom: silence shift wrapping warnings in pmc_sleep_tmr_show()
Message-Id: <53DCFC07.9040006@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140801082715.GE28869@mwanda>
In-Reply-To: <20140801082715.GE28869@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2014/8/2 0:42, Kasagar, Srinidhi wrote:
> On Fri, Aug 01, 2014 at 11:27:15AM +0300, Dan Carpenter wrote:
>> I don't know if we really need 64 bits here but these variables are
>> declared as u64 and it can't hurt to cast this so we prevent any shift
>> wrapping.
> 
> Hmm..not sure the usage of u64 for these registers. AFAIK these registers
> are 32-bit wide..

I didn't declare the registers, I declared the variables in microsecond.

> 
> Aubrey, any reason declaring them as u64?

These registers are the time spent in units of 32us. So yes, we need
64bits here for the conversion.

> 
> Srinidhi
> 
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The patch looks good to me.

Acked-by: Aubrey Li <aubrey.li@linux.intel.com>

>>
>> diff --git a/arch/x86/kernel/pmc_atom.c b/arch/x86/kernel/pmc_atom.c
>> index 0d92ef6..0c424a6 100644
>> --- a/arch/x86/kernel/pmc_atom.c
>> +++ b/arch/x86/kernel/pmc_atom.c
>> @@ -174,11 +174,11 @@ static int pmc_sleep_tmr_show(struct seq_file *s, void *unused)
>>  	struct pmc_dev *pmc = s->private;
>>  	u64 s0ir_tmr, s0i1_tmr, s0i2_tmr, s0i3_tmr, s0_tmr;
>>  
>> -	s0ir_tmr = pmc_reg_read(pmc, PMC_S0IR_TMR) << PMC_TMR_SHIFT;
>> -	s0i1_tmr = pmc_reg_read(pmc, PMC_S0I1_TMR) << PMC_TMR_SHIFT;
>> -	s0i2_tmr = pmc_reg_read(pmc, PMC_S0I2_TMR) << PMC_TMR_SHIFT;
>> -	s0i3_tmr = pmc_reg_read(pmc, PMC_S0I3_TMR) << PMC_TMR_SHIFT;
>> -	s0_tmr = pmc_reg_read(pmc, PMC_S0_TMR) << PMC_TMR_SHIFT;
>> +	s0ir_tmr = (u64)pmc_reg_read(pmc, PMC_S0IR_TMR) << PMC_TMR_SHIFT;
>> +	s0i1_tmr = (u64)pmc_reg_read(pmc, PMC_S0I1_TMR) << PMC_TMR_SHIFT;
>> +	s0i2_tmr = (u64)pmc_reg_read(pmc, PMC_S0I2_TMR) << PMC_TMR_SHIFT;
>> +	s0i3_tmr = (u64)pmc_reg_read(pmc, PMC_S0I3_TMR) << PMC_TMR_SHIFT;
>> +	s0_tmr = (u64)pmc_reg_read(pmc, PMC_S0_TMR) << PMC_TMR_SHIFT;
>>  
>>  	seq_printf(s, "S0IR Residency:\t%lldus\n", s0ir_tmr);
>>  	seq_printf(s, "S0I1 Residency:\t%lldus\n", s0i1_tmr);
> 

