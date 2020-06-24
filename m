From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 24 Jun 2020 15:25:17 +0000
Subject: Re: [PATCH v2] media: venus: core: Fix runtime PM imbalance in venus_probe
Message-Id: <a955a3bc-61f0-06a7-6afa-e812d8e34d98@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Andy Gross <agross@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

I propose to combine two tags in the previous patch subject.


> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced. For other error
> paths after this call, things are the same.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime usage counter is incremented even if a call of
   the function “pm_runtime_get_sync” failed. Thus decrement it also
   in error cases so that the reference counting is kept consistent.

   Add also a call of the function “pm_runtime_get_noresume”
   in one if branch for the completion of the desired exception handling.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
