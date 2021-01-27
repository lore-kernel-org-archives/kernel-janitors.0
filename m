From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 27 Jan 2021 16:47:16 +0000
Subject: Re: [PATCH] hwmon: (aht10) Unlock on error in aht10_read_values()
Message-Id: <20210127164716.GA144600@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBD5Ro549hMJSnW4@mwanda>
In-Reply-To: <YBD5Ro549hMJSnW4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, Johannes Cornelis Draaijer <jcdra1@gmail.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 27, 2021 at 08:25:26AM +0300, Dan Carpenter wrote:
> This error path needs to drop the lock before returning.
> 
> Fixes: afd018716398 ("hwmon: Add AHT10 Temperature and Humidity Sensor Driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,
Guenter
