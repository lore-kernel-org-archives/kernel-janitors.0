From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 23 Jul 2020 20:15:16 +0000
Subject: Re: [PATCH] media: davinci: vpif_capture: fix potential double free
Message-Id: <b179ad63-b895-39f7-dc18-23636f77e1e4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Evgeny Novikov <novikov@ispras.ru>, ldv-project@linuxtesting.org, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>

> In case of errors vpif_probe_complete() releases memory for vpif_obj.sd
> and unregisters the V4L2 device. But then this is done again by
> vpif_probe() itself. The patch removes the cleaning from
> vpif_probe_complete().

* An imperative wording can be preferred for the change description,
  can't it?

* Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
