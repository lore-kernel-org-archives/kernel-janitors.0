From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 28 Apr 2020 23:10:20 +0000
Subject: Re: [PATCH -next] Input: synaptics-rmi4 - fix error return code in rmi_driver_probe()
Message-Id: <20200428231020.GX125362@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428134948.78343-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428134948.78343-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Duggan <aduggan@synaptics.com>, Evan Green <evgreen@chromium.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 28, 2020 at 01:49:48PM +0000, Wei Yongjun wrote:
> Fix to return a negative error code from the input_register_device()
> error handling case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.

> ---
>  drivers/input/rmi4/rmi_driver.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
> index 190b9974526b..bfc08d7b25d0 100644
> --- a/drivers/input/rmi4/rmi_driver.c
> +++ b/drivers/input/rmi4/rmi_driver.c
> @@ -1210,7 +1210,8 @@ static int rmi_driver_probe(struct device *dev)
>  	if (data->input) {
>  		rmi_driver_set_input_name(rmi_dev, data->input);
>  		if (!rmi_dev->xport->input) {
> -			if (input_register_device(data->input)) {
> +			retval = input_register_device(data->input);
> +			if (retval) {
>  				dev_err(dev, "%s: Failed to register input device.\n",
>  					__func__);
>  				goto err_destroy_functions;
> 
> 
> 

-- 
Dmitry
