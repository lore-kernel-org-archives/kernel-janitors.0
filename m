From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Jan 2020 04:25:07 +0000
Subject: Re: [PATCH] x86/microcode/amd: fix uninitalized structure cp
Message-Id: <20200115042507.GE3719@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114111505.320186-1-colin.king@canonical.com>
 <20200114113834.GE31032@zn.tnic>
 <b59bb156-891e-3a26-3204-f5a0a1cc60d3@canonical.com>
 <20200114120156.GG31032@zn.tnic>
 <54eca4f8-33ca-24b1-9123-70df3b164043@canonical.com>
 <20200114121000.GH31032@zn.tnic>
 <fcbb34b0-203e-0c7c-66cc-a3ae6fa3680c@canonical.com>
 <20200114150153.GJ31032@zn.tnic>
In-Reply-To: <20200114150153.GJ31032@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Colin Ian King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 14, 2020 at 04:01:53PM +0100, Borislav Petkov wrote:
> On Tue, Jan 14, 2020 at 02:08:50PM +0000, Colin Ian King wrote:
> > If I understand the question, it seems that get_builtin_microcode()
> > tries to load in the appropriate amd microcode binary from the cpio data
> > and this can potentially fail if the microcode is not provided for the
> > specific processor family, so I believe this is a legitimate fix.
> 
> If the microcode for the specific processor family is not provided,
> get_builtin_firmware() will return false and then we'll call
> find_microcode_in_initrd() which will definitely return either a proper
> pointer or a NULL-initialized cpio_data struct.
> 
> So I still don't see it.

It's probably complaining that cp.name[] isn't initialized.  UBSan will
probably generate a warning at runtime when we do:

	*ret = cp;

But otherwise it's harmless.

regards,
dan carpenter
