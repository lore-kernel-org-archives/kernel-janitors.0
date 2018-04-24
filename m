From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 24 Apr 2018 17:24:47 +0000
Subject: Re: [v2] rsi: remove unecessary PTR_ALIGN()s
Message-Id: <20180424172447.D1A0360131@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180406083717.GA21857@mwanda>
In-Reply-To: <20180406083717.GA21857@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <amit.karwar@redpinesignals.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, Karun Eagalapati <karun256@gmail.com>, Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The issue here is that we allocate "data" and then set
> "data = PTR_ALIGN(data, 8);" and then we free the aligned pointer
> instead of the original pointer.
> 
> kmalloc() pointers are already ARCH_SLAB_MINALIGN aligned which is 8 or
> more on everything except certain Xtensa variants.  We decided that if
> the Xtensa people ever notice a bug here then we'll tell them the bug is
> on their side.  ;)
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

350fcdb83457 rsi: remove unecessary PTR_ALIGN()s

-- 
https://patchwork.kernel.org/patch/10325781/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

