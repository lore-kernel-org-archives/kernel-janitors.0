From: Guenter Roeck <groeck@google.com>
Date: Sun, 08 Mar 2020 22:32:35 +0000
Subject: Re: [PATCH RFC] MAINTAINERS: include GOOGLE FIRMWARE entry
Message-Id: <CABXOdTcrxoBCz24Ap=YJYZnr+oLAmaR10xZ9ar2mYbE1=RAoug@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200308195116.12836-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200308195116.12836-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <swboyd@chromium.org>, Guenter Roeck <groeck@chromium.org>, Julius Werner <jwerner@chromium.org>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Sun, Mar 8, 2020 at 12:51 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
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
> @@ -7111,6 +7111,14 @@ S:       Supported
>  F:     Documentation/networking/device_drivers/google/gve.rst
>  F:     drivers/net/ethernet/google
>
> +GOOGLE FIRMWARE
> +M:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +M:     Stephen Boyd <swboyd@chromium.org>
> +R:     Guenter Roeck <groeck@chromium.org>
> +R:     Julius Werner <jwerner@chromium.org>
> +S:     Maintained
> +F:     drivers/firmware/google/
> +

FWIW, I would not mind stepping up as maintainer if needed, but I
think we should strongly discourage this kind of auto-assignment of
maintainers and/or reviewers.

Guenter

>  GPD POCKET FAN DRIVER
>  M:     Hans de Goede <hdegoede@redhat.com>
>  L:     platform-driver-x86@vger.kernel.org
> --
> 2.17.1
>
