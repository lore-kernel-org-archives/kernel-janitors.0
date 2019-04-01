From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 01 Apr 2019 20:04:20 +0000
Subject: Re: Coccinelle: put_device: reduce false positives
Message-Id: <alpine.DEB.2.21.1904012203490.2530@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1553321671-27749-1-git-send-email-wen.yang99@zte.com.cn>
 <179bbdd1-3fcb-bba5-52b3-7f96973c7650@web.de>
 <alpine.DEB.2.21.1903232104030.5660@hadrien> <20190326084512.GC32590@kadam>
 <alpine.DEB.2.20.1903261037320.5021@hadrien> <20190326101103.GH32613@kadam>
 <alpine.DEB.2.20.1903261115300.5021@hadrien>
 <CAK7LNAT9gKvEX9520Sd50vrS7Gug1JQCMx_TJO_KPQjhjPORXw@mail.gmail.com>
 <94e2410b-d474-be9e-a69f-3851e609eed3@web.de>
In-Reply-To: <94e2410b-d474-be9e-a69f-3851e609eed3@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Wen Yang <wen.yang99@zte.com.cn>, Dan Carpenter <dan.carpenter@oracle.com>



On Mon, 1 Apr 2019, Markus Elfring wrote:

> > I added Fixes: tag,
> > and applied to linux-kbuild/fixes.
>
> Will this extension trigger further adjustments for similar SmPL scripts?
>
> Example:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/scripts/coccinelle/free/pci_free_consistent.cocci?id=F7b167113753e95ae6138=
3e234f8d10142782ace

If there are false positives caused by this or other scripts, feel free to
submit a patch.

julia
