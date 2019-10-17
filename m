From: Guenter Roeck <linux@roeck-us.net>
Date: Thu, 17 Oct 2019 13:39:01 +0000
Subject: Re: [PATCH] hwmon: w83793d: remove redundant assignment to variable res
Message-Id: <20191017133901.GA31691@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191011170215.11539-1-colin.king@canonical.com>
In-Reply-To: <20191011170215.11539-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Rudolf Marek <r.marek@assembler.cz>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 11, 2019 at 06:02:15PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable res is being initialized with a value that
> is never read and is being re-assigned a little later on. The
> assignment is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied. Note that I removed the above Addreddes-Coverity tag as
it doesn't really make much sense.

Guenter

> ---
>  drivers/hwmon/w83793.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
> index 9df48b70c70c..a0307e6761b8 100644
> --- a/drivers/hwmon/w83793.c
> +++ b/drivers/hwmon/w83793.c
> @@ -2096,7 +2096,7 @@ static struct w83793_data *w83793_update_device(struct device *dev)
>  static u8 w83793_read_value(struct i2c_client *client, u16 reg)
>  {
>  	struct w83793_data *data = i2c_get_clientdata(client);
> -	u8 res = 0xff;
> +	u8 res;
>  	u8 new_bank = reg >> 8;
>  
>  	new_bank |= data->bank & 0xfc;
