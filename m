From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 23 Mar 2019 20:06:54 +0000
Subject: Re: [PATCH] coccinelle: put_device: reduce false positives
Message-Id: <alpine.DEB.2.21.1903232104030.5660@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-139833865-1553371615=:5660"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1553321671-27749-1-git-send-email-wen.yang99@zte.com.cn>
 <179bbdd1-3fcb-bba5-52b3-7f96973c7650@web.de>
In-Reply-To: <179bbdd1-3fcb-bba5-52b3-7f96973c7650@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Wen Yang <wen.yang99@zte.com.cn>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-139833865-1553371615=:5660
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sat, 23 Mar 2019, Markus Elfring wrote:

> > Don't complain about a return when this function returns "&pdev->dev".
>
> Would this information qualify to add the tag “Fixes” to the commit message?

Fixes tags relate to stable kernels, so that one can see which stable
kernels a particular patch should be propagated to.  There is no need to
propagate patches on semantic patches to stable kernels.  People who run
stable kernels are interested in their behavior, not the bug finding
rules that they contain.

julia
--8323329-139833865-1553371615=:5660--
