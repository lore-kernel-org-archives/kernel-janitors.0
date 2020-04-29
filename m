From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Apr 2020 20:40:14 +0000
Subject: Re: [PATCH] misc: fastrpc: fix memory leak
Message-Id: <1471e6f6-fd20-334a-041b-9d55be234111@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

> if misc_register() fails, previously allocated data is left without freeing,
> this could result in memory leak.

How do you think about a wording variant like the following?

   Subject:
   [PATCH v2] misc: fastrpc: Fix an incomplete memory release in fastrpc_rpmsg_probe()

   Change description:
   A few fastrpc data were not released after a call of the
   function “misc_register” failed.
   Thus add a call of the function “kfree”.


> So fix it!

Would you like to replace such an information by the tag “Fixes”?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=96c9a7802af7d500a582d89a8b864584fe878c1b#n183

Regards,
Markus
