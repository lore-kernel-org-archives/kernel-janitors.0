From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 12:03:36 +0000
Subject: Re: [PATCH] x86/microcode/amd: fix uninitalized structure cp
Message-Id: <54eca4f8-33ca-24b1-9123-70df3b164043@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114111505.320186-1-colin.king@canonical.com>
 <20200114113834.GE31032@zn.tnic>
 <b59bb156-891e-3a26-3204-f5a0a1cc60d3@canonical.com>
 <20200114120156.GG31032@zn.tnic>
In-Reply-To: <20200114120156.GG31032@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 14/01/2020 12:01, Borislav Petkov wrote:
> On Tue, Jan 14, 2020 at 11:51:43AM +0000, Colin Ian King wrote:
>> Starting at load_ucode_amd_bsp(), this initializes a local cp to zero,
>> then passes &cp when it calls __load_ucode_amd() as parameter *ret.  In
>> __load_ucode_amd a new local cp is created on the stack and *only* is
>> assigned here:
>>
>>        if (!get_builtin_microcode(&cp, x86_family(cpuid_1_eax)))
>>                 cp = find_microcode_in_initrd(path, use_pa);
> 
> Is there any case where cp doesn't get assigned here? Either by
> get_builtin_microcode() or by find_microcode_in_initrd()?
> 
>> I can send a V2 w/o these if it so pleases you. I've had nobody else
>> complain about these and we have literally hundreds of Coverity tagged
>> issues now accepted in the kernel so that we can trace how fixes are
>> found.
> 
> Who's "we" and how can "we" trace them? When I see Addresses-Coverity:
> how can I trace how a fix is found? How can I find out what that tag
> even means?
> 
> All I'm asking is to document how one can find out what that tag means
> and how it can be used by people looking at that commit message.

OK, I will try to extract every special Tag from Coverity and get this
documented when I get some spare cycles.

> 
> Thx.
> 
