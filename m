From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jun 2020 18:24:27 +0000
Subject: Re: [PATCH] media: budget-core: Improve exception handling in budget_register()
Message-Id: <e3633733-8b83-d4ef-3256-e2b1117419f0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chuhong Yuan <hslester96@gmail.com>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>

> Add the missed undo functions for error handling to fix it.

…
> +++ b/drivers/media/pci/ttpci/budget-core.c
> @@ -369,20 +369,25 @@  static int budget_register(struct budget *budget)
…
>  	return 0;
> +
+err:
> +	dvb_dmxdev_release(&budget->dmxdev);
> +	dvb_dmx_release(&budget->demux);
> +	return ret;
>  }
…

Perhaps use the label “release_dmxdev” instead?

Regards,
Markus
