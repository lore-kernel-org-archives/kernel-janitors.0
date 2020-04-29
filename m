From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Apr 2020 11:51:00 +0000
Subject: Re: [PATCH 3/4 v2] firmware: stratix10-svc: Fix some error handling paths in stratix10_svc_drv_probe
Message-Id: <767eb869-d9c1-757b-77a6-79927728ddcd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ff40f39de4deb63b03b363d0e0f3e3c8cccd62d.1588142343.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <0ff40f39de4deb63b03b363d0e0f3e3c8cccd62d.1588142343.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Richard Gong <richard.gong@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Tull <atull@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Moritz Fischer <mdf@kernel.org>

> While at it, also move a 'platform_device_put()' call to the error handling path.

How do you think about to use the message “Complete exception handling
in stratix10_svc_drv_probe()” in the final commit subject?


…
> +++ b/drivers/firmware/stratix10-svc.c
…
> @@ -1043,24 +1043,34 @@  static int stratix10_svc_drv_probe(struct platform_device *pdev)
…
> +	return 0;
> +
> +put_platform:
> +	platform_device_put(svc->stratix10_svc_rsu);
> +err_free_kfifo:
…
>  	return ret;
>  }


Can the label “err_put_device” be more appropriate for the improved
function implementation?
(Or: Would you like to omit the prefix “err_” for these jump targets?)

Regards,
Markus
