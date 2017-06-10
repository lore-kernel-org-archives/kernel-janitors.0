From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 10 Jun 2017 11:33:42 +0000
Subject: Re: [PATCH] i40evf: remove redundant null check on key
Message-Id: <20170610113342.f4v5j3inpoxwqkhf@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170606235407.6478-1-colin.king@canonical.com>
In-Reply-To: <20170606235407.6478-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jeff Kirsher <jeffrey.t.kirsher@intel.com>, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


This patch isn't right...

On Wed, Jun 07, 2017 at 12:54:07AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> key has previously been null checked so the subsequent null check
> is redundant as key can never be null at that point, so remove it.
> 

Actually, it's the reverse.  "key" is always NULL.  Probably the ||
should be a &&?

regards,
dan carpenter

