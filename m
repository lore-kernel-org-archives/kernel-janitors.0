From: Borislav Petkov <bp@alien8.de>
Date: Wed, 15 Jan 2020 12:42:52 +0000
Subject: Re: [PATCH] x86/microcode/amd: fix uninitalized structure cp
Message-Id: <20200115124252.GD20975@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114111505.320186-1-colin.king@canonical.com>
 <20200114113834.GE31032@zn.tnic>
 <b59bb156-891e-3a26-3204-f5a0a1cc60d3@canonical.com>
 <20200114120156.GG31032@zn.tnic>
 <54eca4f8-33ca-24b1-9123-70df3b164043@canonical.com>
 <20200114121000.GH31032@zn.tnic>
 <fcbb34b0-203e-0c7c-66cc-a3ae6fa3680c@canonical.com>
 <20200114150153.GJ31032@zn.tnic>
 <20200115042507.GE3719@kadam>
In-Reply-To: <20200115042507.GE3719@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin Ian King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 15, 2020 at 07:25:07AM +0300, Dan Carpenter wrote:
> It's probably complaining that cp.name[] isn't initialized.

That is possible.

> UBSan will probably generate a warning at runtime when we do:
> 
> 	*ret = cp;
> 
> But otherwise it's harmless.

Yes, because we don't do anything with cpio_data.name.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
