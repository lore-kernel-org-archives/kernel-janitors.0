From: Logan Gunthorpe <logang@deltatee.com>
Date: Wed, 19 Jun 2019 05:39:44 +0000
Subject: Re: [PATCH] NTB: test: remove a duplicate check
Message-Id: <2f4dea74-d78e-8b53-8dec-df8dc032759c@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619053205.GA10452@mwanda>
In-Reply-To: <20190619053205.GA10452@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jon Mason <jdmason@kudzu.us>
Cc: Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

,,

On 2019-06-18 11:32 p.m., Dan Carpenter wrote:
> We already verified that the "nm->isr_ctx" allocation succeeded so there
> is no need to check again here.
> 
> Fixes: a6bed7a54165 ("NTB: Introduce NTB MSI Test Client")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hmm, yup, not sure how that slipped through, must have been a bad rebase
or something. Thanks Dan!

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

> ---
> Hey Logan, can pick a patch prefix when you're introducing a new module?
> "[PATCH] NTB/test: Introduce NTB MSI Test Client" or whatever.

I don't quite follow you there. NTB doesn't really have a good standard
for prefixes. NTB/test might have made sense.

Logan
