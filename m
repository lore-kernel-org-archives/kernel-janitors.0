From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Aug 2019 08:50:08 +0000
Subject: Re: [PATCH] staging: rtl8192u: remove redundant assignment to pointer crypt
Message-Id: <20190822085008.GH4451@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822084609.8971-1-colin.king@canonical.com>
In-Reply-To: <20190822084609.8971-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Whitmore <johnfwhitmore@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 22, 2019 at 09:46:09AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer crypt is being set with a value that is never read,
> the assignment is redundant and hence can be removed.
> 
> Thanks to Dan Carpenter for sanity checking that this was indeed
> redundant.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
