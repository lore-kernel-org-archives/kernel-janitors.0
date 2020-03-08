From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 08 Mar 2020 19:57:34 +0000
Subject: Re: [PATCH RFC] MAINTAINERS: include GOOGLE FIRMWARE entry
Message-Id: <20200308195734.GA4070981@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200308195116.12836-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200308195116.12836-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Guenter Roeck <groeck@chromium.org>, Julius Werner <jwerner@chromium.org>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Mar 08, 2020 at 08:51:16PM +0100, Lukas Bulwahn wrote:
> All files in drivers/firmware/google/ are identified as part of THE REST
> according to MAINTAINERS, but they are really maintained by others.
> 
> Add a basic entry for drivers/firmware/google/ based on a simple statistics
> on tags of commits in that directory:
> 
>   $ git log drivers/firmware/google/ | grep '\-by:' \
>       | sort | uniq -c | sort -nr
>      62     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>      13     Reviewed-by: Guenter Roeck <groeck@chromium.org>
>      12     Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>      11     Reviewed-by: Julius Werner <jwerner@chromium.org>
> 
> There is no specific mailing list for this driver, based on observations
> on the patch emails, and the git history suggests the driver is maintained.
> 
> This was identified with a small script that finds all files belonging to
> THE REST according to the current MAINTAINERS file, and I investigated
> upon its output.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a0f8115c92c..ed788804daab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7111,6 +7111,14 @@ S:	Supported
>  F:	Documentation/networking/device_drivers/google/gve.rst
>  F:	drivers/net/ethernet/google
>  
> +GOOGLE FIRMWARE
> +M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>

No, sorry, I am not the maintainer of this.  I'll be glad to be the
person the maintainers send patches to to get into Linus's tree, but I
am not going to be responsible for stuff I know nothing about :)

thanks,

greg k-h
