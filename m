From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Oct 2017 07:31:06 +0000
Subject: Re: [PATCH 2/2] xen-tpmfront: Combine two condition checks into one statement in vtpm_send()
Message-Id: <20171023073106.7tlcamja5xsi6fwi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf592c7d-8fbc-833b-fa1a-ff9e91c3734c@users.sourceforge.net>
 <f1d76752-d5b4-649d-b11d-63348d439505@users.sourceforge.net>
In-Reply-To: <f1d76752-d5b4-649d-b11d-63348d439505@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-integrity@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Peter =?iso-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Oct 22, 2017 at 01:30:46PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Oct 2017 13:15:16 +0200
> 
> A return was performed with the same error code after two condition checks.
> Thus use a single statement instead.
> 

It's fine as-is, thanks.

regards,
dan carpenter

