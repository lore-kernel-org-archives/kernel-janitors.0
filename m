From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 30 May 2020 09:44:11 +0000
Subject: Re: [PATCH] media: venus: Fix possible buffer overflow in venus_sfr_print()
Message-Id: <30acaf40-3709-d712-892f-c410acd78f63@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jia-Ju Bai <baijiaju1990@gmail.com>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>

Please avoid typos in the patch subject.


> To fix this possible bug, sfr->buf_size is assigned to a local variable,
> and then this variable is checked before being used.

How do you think about a wording variant like the following?

  Thus assign the data structure member “buf_size” to a local variable
  and check it before further usage.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
