From: David Miller <davem@davemloft.net>
Date: Fri, 03 Jan 2020 00:31:41 +0000
Subject: Re: [PATCH 04/10] fsl/fman: use resource_size
Message-Id: <20200102.163141.1473240611016870659.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
        <1577900990-8588-5-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-5-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@inria.fr
Cc: madalin.bucur@nxp.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed,  1 Jan 2020 18:49:44 +0100

> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> The semantic patch that makes these changes is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ struct resource ptr; @@
> - (ptr.end + 1 - ptr.start)
> + resource_size(&ptr)
> 
> @@ struct resource *ptr; @@
> - (ptr->end + 1 - ptr->start)
> + resource_size(ptr)
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied to net-next.

Thanks Julia.
