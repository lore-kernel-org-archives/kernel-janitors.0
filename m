From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Jun 2020 09:33:34 +0000
Subject: Re: [PATCH] Input: stmfts: fix ref count leak in stmfts_input_open
Message-Id: <5b0147ab-f0bc-7380-6300-90e555534cb4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Alexandre Torgue <alexandre.torgue@st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> in stmfts_input_open, …

* Can the term “reference count” become relevant also for this commit message
  besides other possible adjustments?

* Would you like to add the tag “Fixes”?


…
> +++ b/drivers/input/touchscreen/stmfts.c
…
> @@ -367,6 +367,9 @@  static int stmfts_input_open(struct input_dev *dev)
>  	}
>
>  	return 0;
> +out:
> +	pm_runtime_put(&sdata->client->dev);
> +	return err;
>  }
…

Perhaps use the label “put_runtime” instead?

Regards,
Markus
