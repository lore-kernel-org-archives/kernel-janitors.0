From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Aug 2013 07:13:04 +0000
Subject: Re: [PATCH v3] xHCI: Fixing xhci_readl definition and function call
Message-Id: <20130828071304.GO6329@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1377482937-7486-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1377482937-7486-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gaurav <kumargauravgupta3@gmail.com>
Cc: sarah.a.sharp@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 26, 2013 at 07:38:57AM +0530, Kumar Gaurav wrote:
> This patch redefine function xhci_readl.xhci_readl function doesn't use xhci_hcd argument.
> Hence there is no need of keeping it in the function arguments. 
> 
> Redefining this function breaks other functions which calls this function.
> This phatch also correct those calls in xhci driver. 
> 
> Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com>
> ---

Could you put a list of changes since v2 here?:

v3:  blah blah changelog mostly.

Also this doesn't apply for me against linux-next.

regards,
dan carpenter

