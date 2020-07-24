From: Evgeny Novikov <novikov@ispras.ru>
Date: Fri, 24 Jul 2020 20:08:02 +0000
Subject: Re: [PATCH] media: davinci: vpif_capture: fix potential double free
Message-Id: <236161595621028@mail.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b179ad63-b895-39f7-dc18-23636f77e1e4@web.de>
In-Reply-To: <b179ad63-b895-39f7-dc18-23636f77e1e4@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <markus.elfring@web.de>, "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>

Hi Markus,

It seems that Lad Prabhakar detected a critical issue introduced by the patch instead of a minor bug fixed by it. So, we should take care of this first, but I will address your notes as well. 

-- 
Evgeny Novikov
Linux Verification Center, ISP RAS
http://linuxtesting.org

23.07.2020, 23:15, "Markus Elfring" <markus.elfring@web.de>:
>>  In case of errors vpif_probe_complete() releases memory for vpif_obj.sd
>>  and unregisters the V4L2 device. But then this is done again by
>>  vpif_probe() itself. The patch removes the cleaning from
>>  vpif_probe_complete().
>
> * An imperative wording can be preferred for the change description,
>   can't it?
>
> * Would you like to add the tag “Fixes” to the commit message?
>
> Regards,
> Markus
