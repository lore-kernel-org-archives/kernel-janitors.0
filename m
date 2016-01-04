From: Guenter Roeck <linux@roeck-us.net>
Date: Mon, 04 Jan 2016 18:39:51 +0000
Subject: Re: [PATCH] hwmon: (ibmaem) constify aem_rw_sensor_template and aem_ro_sensor_template structures
Message-Id: <20160104183951.GA6973@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jean Delvare <jdelvare@suse.com>, kernel-janitors@vger.kernel.org, lm-sensors@lm-sensors.org, linux-kernel@vger.kernel.org

On Mon, Jan 04, 2016 at 05:36:01PM +0100, Julia Lawall wrote:
> The aem_rw_sensor_template and aem_ro_sensor_template structures are never
> modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.

Thanks,
Guenter
