From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 23 Jul 2020 19:51:23 +0000
Subject: Re: [PATCH] media: camss: fix memory leaks on error handling paths in probe
Message-Id: <64581990-1f68-131d-2e38-8d3e0b9cbd2a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Evgeny Novikov <novikov@ispras.ru>, Anton Vasilyev <vasilyev@ispras.ru>, ldv-project@linuxtesting.org, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Todor Tomov <todor.too@gmail.com>

> camss_probe() does not free camss on error handling paths. The patch
> introduces an additional error label for this purpose.

* I suggest to use an imperative wording for the change description.

* Would you like to use also a jump target like the following
  at the end of this function implementation?

+e_nomem:
+	ret = -ENOMEM;
+	goto err_free;


* Will the tag “Fixes” become helpful for the commit message?


>                                                        Besides, it
> removes call of v4l2_async_notifier_cleanup() from
> camss_of_parse_ports() since its caller, camss_probe(), cleans up all
> its resources itself.

I propose to offer such a change by a separate update step.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=d15be546031cf65a0fc34879beca02fd90fe7ac7#n138


Regards,
Markus
