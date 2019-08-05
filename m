From: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Mon, 05 Aug 2019 10:43:32 +0000
Subject: Re: [PATCH 0/2] usb: xhci: dbc: 2 smalll fixes for 'xhci_dbc_alloc_requests()'
Message-Id: <32129b2c-e447-9e80-90df-e99f74308bcc@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 31.7.2019 15.51, Christophe JAILLET wrote:
> 
> 
> Christophe JAILLET (2):
>    usb: xhci: dbc: Simplify error handling in 'xhci_dbc_alloc_requests()'
>    usb: xhci: dbc: Use GFP_KERNEL instead of GFP_ATOMIC in
>      'xhci_dbc_alloc_requests()'
> 
>   drivers/usb/host/xhci-dbgtty.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Thanks, adding to queue

-Mathias
