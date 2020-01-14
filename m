From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 11:51:43 +0000
Subject: Re: [PATCH] x86/microcode/amd: fix uninitalized structure cp
Message-Id: <b59bb156-891e-3a26-3204-f5a0a1cc60d3@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114111505.320186-1-colin.king@canonical.com>
 <20200114113834.GE31032@zn.tnic>
In-Reply-To: <20200114113834.GE31032@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 14/01/2020 11:38, Borislav Petkov wrote:
> On Tue, Jan 14, 2020 at 11:15:05AM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> In the case where cp is not assigned to the return from
>> the call to find_microcode_in_initrd
> 
> Where does this happen? I don't see it.

Starting at load_ucode_amd_bsp(), this initializes a local cp to zero,
then passes &cp when it calls __load_ucode_amd() as parameter *ret.  In
__load_ucode_amd a new local cp is created on the stack and *only* is
assigned here:

       if (!get_builtin_microcode(&cp, x86_family(cpuid_1_eax)))
                cp = find_microcode_in_initrd(path, use_pa);

otherwise cp is not initialized and contains garbage.  Finally, *ret is
assigned to cp:

	*ret = cp;

..and so load_ucode_amd_bsp() gets a copy of the uninitalized cp via *ret.


>> cp is uninitialized when
>> it is assigned to *ret.   Functions that call __load_ucode_amd
>> such as load_ucode_amd_bsp can therefore end up checking bogus
>> values cp.data and cp.size.  Fix this by ensuring cp is
>> initialized as all zero and remove the redundant initialization
>> of cp in load_ucode_amd_bsp.
>>
>> Addresses-Coverity: ("Uninitialized scalar variable")
> 
> I already asked about those: either document what those tags mean or
> remove them.
> 

I can send a V2 w/o these if it so pleases you. I've had nobody else
complain about these and we have literally hundreds of Coverity tagged
issues now accepted in the kernel so that we can trace how fixes are found.

Colin
