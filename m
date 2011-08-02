From: Marcelo Tosatti <mtosatti@redhat.com>
Date: Tue, 02 Aug 2011 16:44:12 +0000
Subject: Re: [PATCH 4/11] arch/x86/kvm/vmx.c: trivial: use BUG_ON
Message-Id: <20110802164412.GC5144@amt.cnet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
 <1312281304-11847-5-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-5-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Avi Kivity <avi@redhat.com>, trivial@kernel.org, kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 02, 2011 at 12:34:57PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use BUG_ON(x) rather than if(x) BUG();
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ identifier x; @@
> -if (x) BUG();
> +BUG_ON(x);
> 
> @@ identifier x; @@
> -if (!x) BUG();
> +BUG_ON(!x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks.

