From: David Miller <davem@davemloft.net>
Date: Fri, 02 Mar 2018 15:05:54 +0000
Subject: Re: [PATCH] net/usb/kalmia: use ARRAY_SIZE for various array sizing calculations
Message-Id: <20180302.100554.633342004233205400.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180302134239.31599-1-colin.king@canonical.com>
In-Reply-To: <20180302134239.31599-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: johannes.berg@intel.com, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  2 Mar 2018 13:42:39 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Use the ARRAY_SIZE macro on a couple of arrays to determine
> size of the arrays. Also fix up alignment to clean up a checkpatch
> warning. Improvement suggested by Coccinelle.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
