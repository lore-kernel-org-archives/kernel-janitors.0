From: Scott Wood <oss@buserror.net>
Date: Mon, 06 Jan 2020 18:06:31 +0000
Subject: Re: [PATCH 05/10] powerpc/83xx: use resource_size
Message-Id: <88cb950e3ad4040a368d946909d8818c4372894f.camel@buserror.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
 <1577900990-8588-6-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-6-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Wed, 2020-01-01 at 18:49 +0100, Julia Lawall wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ struct resource ptr; @@
> - (ptr.end - ptr.start + 1)
> + resource_size(&ptr)
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  arch/powerpc/platforms/83xx/km83xx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Scott Wood <oss@buserror.net>

-Scott
