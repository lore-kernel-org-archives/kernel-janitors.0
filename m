From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Date: Mon, 14 Aug 2017 04:12:00 +0000
Subject: Re: [PATCH] powerpc/perf: double unlock bug in imc_common_cpuhp_mem_free()
Message-Id: <e2f2122b-87b8-6b01-607b-d00da4fc6b09@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170811200541.qlxcpp3og33sdki3@mwanda>
 <87bmnisu5a.fsf@concordia.ellerman.id.au>
In-Reply-To: <87bmnisu5a.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>, Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Anju T Sudhakar <anju@linux.vnet.ibm.com>
Cc: Paul Mackerras <paulus@samba.org>, Hemant Kumar <hemant@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org



On Monday 14 August 2017 09:00 AM, Michael Ellerman wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>
>> There is a typo so we call unlock instead of lock.
>>
>> Fixes: 885dcd709ba9 ("powerpc/perf: Add nest IMC PMU support")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> I also don't understand how the &nest_imc_refc[node_id].lock works.  Why
>> can't we use ref->lock everywhere?  They seem equivalent, and my static
>> checker complains if we call the same lock different names.
> That looks like a bug to me, ie. we should always use ref.

ok. will send a fix.

Thanks
Maddy

>
> Maddy?
>
> cheers
>
>> diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
>> index 46cd912af060..52017f6eafd9 100644
>> --- a/arch/powerpc/perf/imc-pmu.c
>> +++ b/arch/powerpc/perf/imc-pmu.c
>> @@ -1124,7 +1124,7 @@ static void cleanup_all_thread_imc_memory(void)
>>   static void imc_common_cpuhp_mem_free(struct imc_pmu *pmu_ptr)
>>   {
>>   	if (pmu_ptr->domain = IMC_DOMAIN_NEST) {
>> -		mutex_unlock(&nest_init_lock);
>> +		mutex_lock(&nest_init_lock);
>>   		if (nest_pmus = 1) {
>>   			cpuhp_remove_state(CPUHP_AP_PERF_POWERPC_NEST_IMC_ONLINE);
>>   			kfree(nest_imc_refc);

