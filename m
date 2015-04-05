From: Samuel Ortiz <sameo@linux.intel.com>
Date: Sun, 05 Apr 2015 23:23:09 +0000
Subject: Re: [PATCH 16/16] NFC: pn533: fix error return code
Message-Id: <20150405232309.GC12567@ribalta.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
 <1428235596-4757-17-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428235596-4757-17-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, kernel-janitors@vger.kernel.org, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Sun, Apr 05, 2015 at 02:06:36PM +0200, Julia Lawall wrote:
> Return a negative error code on failure.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> identifier ret; expression e1,e2;
> @@
> (
> if (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/nfc/pn533.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
Applied, thanks.

Cheers,
Samuel.
