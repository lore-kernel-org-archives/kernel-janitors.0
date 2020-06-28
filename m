From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 28 Jun 2020 13:16:23 +0000
Subject: Re: [PATCH v3] media: venus: core: Fix runtime PM imbalance in venus_probe()
Message-Id: <9797fb44-e10e-61b5-b2cc-82d94cc98a3c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Andy Gross <agross@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

> when it returns an error code. Thus a pairing decrement is needed on

* I find it more appropriate to use the word “corresponding” here
  (if you do still not like previous wording suggestions).

* Will it become helpful to add the tag “Fixes” to the commit message?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=719fdd32921fb7e3208db8832d32ae1c2d68900f#n183

* Would you like to improve the change description any more?


> ---
>  drivers/media/platform/qcom/venus/core.c | 5 ++++-

I suggest replace the triple dashes before this diffstat by a blank line.

Regards,
Markus
