From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 17 May 2019 07:31:53 +0000
Subject: Re: [PATCH v2] staging: vt6656: returns error code on vnt_int_start_interrupt fail
Message-Id: <20190517073153.GA4776@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190516093046.1400-1-quentin.deslandes@itdev.co.uk>
 <20190516115653.15120-1-quentin.deslandes@itdev.co.uk>
In-Reply-To: <20190516115653.15120-1-quentin.deslandes@itdev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Mukesh Ojha <mojha@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Forest Bond <forest@alittletooquiet.net>, Ojaswin Mujoo <ojaswin25111998@gmail.com>

On Thu, May 16, 2019 at 11:57:15AM +0000, Quentin Deslandes wrote:
> Returns error code from 'vnt_int_start_interrupt()' so the device's private
> buffers will be correctly freed and 'struct ieee80211_hw' start function
> will return an error code.
> 
> Signed-off-by: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
> ---
>  drivers/staging/vt6656/int.c      |  4 +++-
>  drivers/staging/vt6656/int.h      |  2 +-
>  drivers/staging/vt6656/main_usb.c | 12 +++++++++---
>  3 files changed, 13 insertions(+), 5 deletions(-)

What changed from v1?  Always put that below the --- line.

Please fix up and resend a v3.

thanks,

greg k-h
