From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Dec 2014 14:18:51 +0000
Subject: Re: [patch] mpt2sas: issue reset is not uninitialized
Message-Id: <20141203141851.GU5048@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141203100941.GB29583@mwanda>
 <547F1AB0.30705@bfs.de>
In-Reply-To: <547F1AB0.30705@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 03, 2014 at 03:14:08PM +0100, walter harms wrote:
> hi Dan,
> just a minor question:
> 
> did you forget to mention that you also changed from u8 to bool or was this unintentional ?
> 

That's a trivial thing and I didn't think it was worth mentioning.

regards,
dan carpenter

