From: Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 14 Jan 2020 11:58:20 +0000
Subject: Re: [PATCH] x86/microcode/amd: fix uninitalized structure cp
Message-Id: <8736cickrn.fsf@nanos.tec.linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114111505.320186-1-colin.king@canonical.com> <20200114113834.GE31032@zn.tnic> <b59bb156-891e-3a26-3204-f5a0a1cc60d3@canonical.com>
In-Reply-To: <b59bb156-891e-3a26-3204-f5a0a1cc60d3@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> writes:
> On 14/01/2020 11:38, Borislav Petkov wrote:
>>>
>>> Addresses-Coverity: ("Uninitialized scalar variable")
>> 
>> I already asked about those: either document what those tags mean or
>> remove them.
>> 
> I can send a V2 w/o these if it so pleases you. I've had nobody else
> complain about these and we have literally hundreds of Coverity tagged
> issues now accepted in the kernel so that we can trace how fixes are found.

Please keep them. Having a reference how stuff got "reported" _is_
useful.

Thanks,

        tglx
