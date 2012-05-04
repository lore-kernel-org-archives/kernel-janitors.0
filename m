From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 May 2012 13:34:42 +0000
Subject: Re: [PATCH] Staging: Comedi adv_pci1710 : Corrected DPRINTK formatting
Message-Id: <20120504133442.GC22134@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 03, 2012 at 06:27:36PM +0300, Tomas Melin wrote:
> Corrected formatting for several DPRINT messages.
> 

This patch is fine, but eventually these will have to changed to:

		dev_dbg(dev->class_dev,
			"adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=1\n",
			err);

Or even better they can just be removed after the driver is stable.
It's not worth shifting things around too much if we're just going
to redo it later.

regards,
dan carpenter

