From: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 14 Aug 2018 13:39:34 +0000
Subject: Re: [PATCH 1/2] hwmon: (adt7475) Potential error pointer dereferences
Message-Id: <20180814133934.GA11077@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180814091236.zubxfj32bedobr52@kili.mountain>
In-Reply-To: <20180814091236.zubxfj32bedobr52@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, Tokunori Ikegami <ikegami@allied-telesis.co.jp>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 14, 2018 at 12:12:36PM +0300, Dan Carpenter wrote:
> The adt7475_update_device() function returns error pointers.  The
> problem is that in show_pwmfreq() we dereference it before the check.
> And then in pwm_use_point2_pwm_at_crit_show() there isn't a check at
> all.  I don't know if it's required, but it silences a static checker
> warning and it's doesn't hurt anything to check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

Applied.

Thanks,
Guenter
