From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 02 Oct 2019 12:38:22 +0000
Subject: Re: [PATCH] perf/x86/intel/uncore: fix integer overflow on shift of a u32 integer
Message-Id: <e4ed06d7-2273-6dc2-1cf0-16e70bc34420@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191002115545.15570-1-colin.king@canonical.com>
 <20191002122357.GA29018@lakrids.cambridge.arm.com>
In-Reply-To: <20191002122357.GA29018@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kan Liang <kan.liang@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/10/2019 13:23, Mark Rutland wrote:
> On Wed, Oct 02, 2019 at 12:55:45PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Shifting the u32 integer result of (pci_dword & SNR_IMC_MMIO_BASE_MASK)
>> will end up with an overflow when pci_dword greater than 0x1ff. Fix this
>> by casting pci_dword to a resource_size_t before masking and shifting it.
>>
>> Addresses-Coverity: ("Unintentional integer overflow")
> 
> I don't see that tag in Documentation/process/submitting-patches.rst ;)
> 
> IIUC this is unintented truncation of the upper bits due to missing type
> promotion before the shift, rather than overflow (i.e. the value
> wrapping across addition/subtraction), so I think the wording is
> slightly misleading.
> 
> Does coverity call that integer overflow?

Coverity calls it "Unintentional integer overflow". I suspect Coverity
first spots the overflow before the truncation occurs and so flags that
up as the root cause.

> 
> It might be better to say:
> 
> | [PATCH] perf/x86/intel/uncore: don't truncate upper bits of address
> |
> | Shifting the u32 integer result of (pci_dword & SNR_IMC_MMIO_BASE_MASK)
> | by 23 will throw away the upper 23 bits of the potentially 64-bit
> | address. Fix this by casting pci_dword to a resource_size_t before
> | masking and shifting it.
> |
> | Found by coverity ("Unintentional integer overflow").
> 
> Otherwise, the patch looks fine to me:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> Thanks,
> Mark.
> 
>> Fixes: ee49532b38dd ("perf/x86/intel/uncore: Add IMC uncore support for Snow Ridge")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  arch/x86/events/intel/uncore_snbep.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/events/intel/uncore_snbep.c b/arch/x86/events/intel/uncore_snbep.c
>> index b10a5ec79e48..ed69df1340d9 100644
>> --- a/arch/x86/events/intel/uncore_snbep.c
>> +++ b/arch/x86/events/intel/uncore_snbep.c
>> @@ -4415,7 +4415,7 @@ static void snr_uncore_mmio_init_box(struct intel_uncore_box *box)
>>  		return;
>>  
>>  	pci_read_config_dword(pdev, SNR_IMC_MMIO_BASE_OFFSET, &pci_dword);
>> -	addr = (pci_dword & SNR_IMC_MMIO_BASE_MASK) << 23;
>> +	addr = ((resource_size_t)pci_dword & SNR_IMC_MMIO_BASE_MASK) << 23;
>>  
>>  	pci_read_config_dword(pdev, SNR_IMC_MMIO_MEM0_OFFSET, &pci_dword);
>>  	addr |= (pci_dword & SNR_IMC_MMIO_MEM0_MASK) << 12;
>> -- 
>> 2.20.1
>>
