From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 23 Mar 2019 19:44:40 +0000
Subject: Re: [PATCH] coccinelle: put_device: reduce false positives
Message-Id: <179bbdd1-3fcb-bba5-52b3-7f96973c7650@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1553321671-27749-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1553321671-27749-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr

> Don't complain about a return when this function returns "&pdev->dev".

Would this information qualify to add the tag “Fixes” to the commit message?

Regards,
Markus
