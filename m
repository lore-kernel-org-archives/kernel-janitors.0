From: Joerg Roedel <joro@8bytes.org>
Date: Mon, 05 Apr 2010 14:09:09 +0000
Subject: Re: [patch] dma-debug: off by one issue
Message-Id: <20100405140909.GB29758@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100402112843.GI5265@bicker> <20100403204717.GS24846@8bytes.org> <20100405125329.GA16197@bicker> <20100405140215.GA29758@8bytes.org>
In-Reply-To: <20100405140215.GA29758@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Joerg Roedel <joerg.roedel@amd.com>, Ingo Molnar <mingo@elte.hu>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Shaun Ruffell <sruffell@digium.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 05, 2010 at 04:02:15PM +0200, Joerg Roedel wrote:
> On Mon, Apr 05, 2010 at 03:53:30PM +0300, Dan Carpenter wrote:
> > On Sat, Apr 03, 2010 at 10:47:17PM +0200, Joerg Roedel wrote:
> 
> > > The character is already reserved by the user-to-kernel copy earlier in
> > > the function.
> > 
> > Yes, but the original code requires more code reading to audit. Let's 
> > change the commit message to say that it's a clean up patch.
> 
> In this case its better to remove the
> 
> 	current_driver_name[i] = 0;
> 
> line just after the loop.

Ah no, thats nonsense. Mind to resend the patch with a new
commit-message? I'll queue it then tomorrow.

	Joerg

