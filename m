From: Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 05 Jun 2017 17:51:44 +0000
Subject: Re: [PATCH 0/3] ARM-XEN: Adjustments for __set_phys_to_machine_multi()
Message-Id: <alpine.DEB.2.10.1706051051190.2941@sstabellini-ThinkPad-X260>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b9230f4-0f00-e019-75b4-571e29b52998@users.sourceforge.net>
In-Reply-To: <9b9230f4-0f00-e019-75b4-571e29b52998@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sun, 4 Jun 2017, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 4 Jun 2017 22:45:54 +0200
> 
> Three update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (3):
>   Improve a size determination
>   Delete an error message for a failed memory allocation
>   Adjust one function call together with a variable assignment
> 
>  arch/arm/xen/p2m.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Thanks Markus, I queued them up for 4.13.
