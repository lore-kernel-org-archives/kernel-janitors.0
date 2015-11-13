From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 13 Nov 2015 16:38:50 +0000
Subject: Re: [PATCH v2] dmaengine: ioatdma: constify dca_ops structures
Message-Id: <CAPcyv4jfz445BmwxiH7vcgmejs1=b5zYJ2vpcSy+fxYHddEB3A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447410688-7213-1-git-send-email-Julia.Lawall@lip6.fr>
	<alpine.DEB.2.10.1511131244230.2561@hadrien>
In-Reply-To: <alpine.DEB.2.10.1511131244230.2561@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>

On Fri, Nov 13, 2015 at 3:46 AM, Julia Lawall <julia.lawall@lip6.fr> wrote:
> The dca_ops structure is never modified, so declare it as const.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Dan Williams <dan.j.williams@intel.com>
