From: Marcel Holtmann <marcel@holtmann.org>
Date: Sat, 01 Aug 2015 13:20:56 +0000
Subject: Re: [patch] Bluetooth: fix breakage in amp_write_rem_assoc_frag()
Message-Id: <0D12F29F-827C-4C1C-BA49-062DF0D7CCC2@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150801123008.GA4378@mwanda>
In-Reply-To: <20150801123008.GA4378@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arron Wang <arron.wang@intel.com>, "Gustavo F. Padovan" <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, BlueZ development <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

> We should be passing the pointer itself instead of the address of the
> pointer.
> 
> This was a copy and paste bug when we replaced the calls to
> hci_send_cmd().  Originally, the arguments were "len, cp" but we
> overwrote them with "sizeof(cp), &cp" by mistake.
> 
> Fixes: b3d3914006a0 ('Bluetooth: Move amp assoc read/write completed callback to amp.c')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I'm pretty sure this is correct, but it's a static checker fix and I
> haven't tested it.

it is correct and patch has been applied to bluetooth-next tree.

Regards

Marcel

