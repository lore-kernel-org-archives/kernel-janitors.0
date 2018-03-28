From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 28 Mar 2018 11:39:51 +0000
Subject: Re: [PATCH] staging: wilc1000: replace kmalloc + memcpy with kmemdup
Message-Id: <20180328113951.GA11213@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180326171629.28700-1-colin.king@canonical.com>
In-Reply-To: <20180326171629.28700-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Aditya Shankar <aditya.shankar@microchip.com>, Ganesh Krishna <ganesh.krishna@microchip.com>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 26, 2018 at 06:16:29PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Replace several allocation and memcpys with kmemdup and add in some
> missing memory allocation failure checks.  Also fix an incorrect 
> -EFAULT return with -ENOMEM.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/wilc1000/host_interface.c | 75 +++++++++++++++++++------------
>  1 file changed, 46 insertions(+), 29 deletions(-)

Doesn't apply to my tree anymore, due to patches submitted before yours
:(

greg k-h
