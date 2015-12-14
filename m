From: Guenter Roeck <linux@roeck-us.net>
Date: Mon, 14 Dec 2015 03:38:42 +0000
Subject: Re: [PATCH] hwmon: constify sensor_template_group structures
Message-Id: <566E39C2.70005@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449938199-26314-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1449938199-26314-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org, lm-sensors@lm-sensors.org, linux-kernel@vger.kernel.org

On 12/12/2015 08:36 AM, Julia Lawall wrote:
> The sensor_template_group structures are never modified, so declare them as
> const.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to hwmon-next.

Thanks,
Guenter

