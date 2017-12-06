From: Ingo Molnar <mingo@kernel.org>
Date: Wed, 06 Dec 2017 17:15:15 +0000
Subject: Re: [PATCH] x86/platform/UV: make functions uv_handle_nmi and uv_nmi_setup_common static
Message-Id: <20171206171515.c6phtllfdw7nfbix@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171206170828.23524-1-colin.king@canonical.com>
In-Reply-To: <20171206170828.23524-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "maintainer:X86" <x86@kernel.org>, Mike Travis <mike.travis@hpe.com>, Russ Anderson <russ.anderson@hpe.com>, "travis @ sgi . com" <travis@sgi.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


* Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Functions uv_handle_nmi and uv_nmi_setup_common are local to the
> source and do not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings:
> symbol 'uv_handle_nmi' was not declared. Should it be static?
> symbol 'uv_nmi_setup_common' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/platform/uv/uv_nmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Please combine your three pending x86 Sparse fix patches (this one, the x86/vector 
one and the x86/mm one) into a single patch. They are trivial and should not be 
split into 3 patches.

Thanks,

	Ingo
