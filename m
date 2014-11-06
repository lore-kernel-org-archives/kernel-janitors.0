From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 06 Nov 2014 06:39:32 +0000
Subject: Re: [patch] scsi: missing braces in scsi_extd_sense_format()
Message-Id: <20141106063932.GB26433@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141105203837.GA26314@mwanda>
In-Reply-To: <20141105203837.GA26314@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, Hannes Reinecke <hare@suse.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 05, 2014 at 11:38:37PM +0300, Dan Carpenter wrote:
> There were missing curly braces so we always return the first
> additional2[] string.
> 
> Fixes: 7046d2fa6dbd ('scsi: use sdev as argument for sense code printing')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks! 
