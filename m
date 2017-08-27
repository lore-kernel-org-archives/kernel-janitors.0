From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Sun, 27 Aug 2017 13:38:17 +0000
Subject: Re: [PATCH resend] thunderbolt: Fix reset response_type
Message-Id: <20170827133817.GD2980@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <735914a9-3d8f-7d98-35c3-6e2e046e70c2@canonical.com>
 <20170816085417.7xlnl54jkx2p36qs@mwanda>
In-Reply-To: <20170816085417.7xlnl54jkx2p36qs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Colin King <colin.king@canonical.com>

On Wed, Aug 16, 2017 at 11:54:17AM +0300, Dan Carpenter wrote:
> There is a mistake here where we accidentally use sizeof(TB_CFG_PKG_RESET)
> instead of just TB_CFG_PKG_RESET.  The size of an int is 4 so it's the
> same as TB_CFG_PKG_NOTIFY_ACK.
> 
> Fixes: d7f781bfdbf4 ("thunderbolt: Rework control channel to be more reliable")
> Reported-by: Colin King <colin.king@canonical.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Resending with Greg CC'd.  This was also:
> Signed-off-by: Andreas Noever <andreas.noever@gmail.com>
> But I wasn't sure if I should add that tag.

Hi Greg,

Can you pick this fix to your char-misc tree?

Thanks!
