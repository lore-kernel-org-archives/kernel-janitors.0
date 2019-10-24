From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 24 Oct 2019 07:55:34 +0000
Subject: Re: [PATCH v2] coccicheck: support $COCCI being defined as a directory
Message-Id: <37ad0bcd-941d-e02e-ae99-e89f2ce98ff0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1910240816040.2771@hadrien>
In-Reply-To: <alpine.DEB.2.21.1910240816040.2771@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Zhong Shiqi <zhong.shiqi@zte.com.cn>

> Second the commit log could be more concise as:

I like your desire for choosing a more appropriate commit message.


> Allow defining COCCI as a directory that contains .cocci files.

I would prefer to concentrate the patch subject on other information.


> In general, at least in simple cases, it is not necessary to mention the
> name of the file you are modifying in the comit log, because one can see
> that just below from looking at the diffstat and the patch.

This view can be reasonable. - How does it fit to the usual requirement
for the specification of a “subsystem” (or “prefix”) according to the
canonical patch format?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=13b86bc4cd648eae69fdcf3d04b2750c76350053#n656

Regards,
Markus
