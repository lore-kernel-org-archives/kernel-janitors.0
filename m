From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 28 Nov 2017 14:09:03 +0000
Subject: Re: [PATCH] USB: atm: use setup_timer instead of init_timer
Message-Id: <20171128140903.GA32494@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171124133154.32117-1-colin.king@canonical.com>
In-Reply-To: <20171124133154.32117-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Duncan Sands <duncan.sands@free.fr>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 24, 2017 at 01:31:54PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Use setup_timer function instead of initializing timer with the
> function and data fields.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/atm/usbatm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

This doesn't apply to 4.15-rc1 at all :(
