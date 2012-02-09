From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 09 Feb 2012 01:16:11 +0000
Subject: Re: [PATCH v2 02/17] Staging: quickstart: Prefix remaining functions names with quickstart_
Message-Id: <20120209011611.GA13552@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-3-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-3-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 11, 2012 at 11:22:37PM +0100, Szymon Janc wrote:
> Signed-off-by: Szymon Janc <szymon@janc.net.pl>
> ---
>  drivers/staging/quickstart/quickstart.c |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
> index d03b89d..adce56b 100644
> --- a/drivers/staging/quickstart/quickstart.c
> +++ b/drivers/staging/quickstart/quickstart.c
> @@ -92,19 +92,19 @@ static struct acpi_driver quickstart_acpi_driver = {
>  struct input_dev *quickstart_input;
>  
>  /* Platform driver structs */
> -static ssize_t buttons_show(struct device *dev,
> +static ssize_t quickstart_buttons_show(struct device *dev,
>  					struct device_attribute *attr,
>  					char *buf);

I'll take this, but you do know there is no reason for this, as these
are static functions.  I'd recommend keeping them as short as possible,
but hey, it's not my code...

thanks,

greg k-h
