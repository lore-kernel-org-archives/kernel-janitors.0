From: Samuel Ortiz <sameo@linux.intel.com>
Date: Sun, 20 Dec 2015 17:51:18 +0000
Subject: Re: [PATCH] nfc: s3fwrn5: constify s3fwrn5_phy_ops structures
Message-Id: <20151220175118.GB4772@zurbaran.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447416281-3357-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447416281-3357-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Robert Baldyga <r.baldyga@samsung.com>, kernel-janitors@vger.kernel.org, Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, linux-nfc@lists.01.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Fri, Nov 13, 2015 at 01:04:41PM +0100, Julia Lawall wrote:
> The s3fwrn5_phy_ops structure is never modified, so declare it as const.
> 
> Done with the help of Coccinelle.
Applied to nfc-next, thanks.

Cheers,
Samuel.
