From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Feb 2017 09:20:07 +0000
Subject: Re: [patch] tpm: silence an array overflow warning
Message-Id: <20170206092007.GA11103@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170203103040.GA5467@mwanda>
 <20170203181120.d3r7ab4twbvelwmi@intel.com>
In-Reply-To: <20170203181120.d3r7ab4twbvelwmi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Nayna Jain <nayna@linux.vnet.ibm.com>, Marcel Selhorst <tpmdd@selhorst.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, tpmdd-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

On Fri, Feb 03, 2017 at 08:11:20PM +0200, Jarkko Sakkinen wrote:
> On Fri, Feb 03, 2017 at 01:30:40PM +0300, Dan Carpenter wrote:
> > We should check that we're within bounds first before checking that
> > "chip->active_banks[i] != TPM2_ALG_ERROR" so I've re-ordered the two
> > checks.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thank you, good catch! Do you mind if I squash this.
> 

Not at all.

regards,
dan carpenter

