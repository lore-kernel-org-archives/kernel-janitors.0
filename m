From: Borislav Petkov <bp@alien8.de>
Date: Tue, 14 Jan 2020 11:38:34 +0000
Subject: Re: [PATCH] x86/microcode/amd: fix uninitalized structure cp
Message-Id: <20200114113834.GE31032@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114111505.320186-1-colin.king@canonical.com>
In-Reply-To: <20200114111505.320186-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 14, 2020 at 11:15:05AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where cp is not assigned to the return from
> the call to find_microcode_in_initrd

Where does this happen? I don't see it.

> cp is uninitialized when
> it is assigned to *ret.   Functions that call __load_ucode_amd
> such as load_ucode_amd_bsp can therefore end up checking bogus
> values cp.data and cp.size.  Fix this by ensuring cp is
> initialized as all zero and remove the redundant initialization
> of cp in load_ucode_amd_bsp.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")

I already asked about those: either document what those tags mean or
remove them.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
