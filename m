From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 12 Jan 2020 08:42:12 +0000
Subject: Re: [PATCH v3] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <alpine.DEB.2.21.2001120941270.2552@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1467652441-1578818533=:2552"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110131526.60180-1-wenyang@linux.alibaba.com>
 <6cc0c851-7a32-d82a-1c0c-51a08538b445@web.de>
In-Reply-To: <6cc0c851-7a32-d82a-1c0c-51a08538b445@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Wen Yang <wenyang@linux.alibaba.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Matthias_M=E4nnich?= <maennich@google.com>, Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1467652441-1578818533=:2552
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 12 Jan 2020, Markus Elfring wrote:

> > This semantic patch is inspired by Mateusz Guzik's patch:
>
> Does such a wording mean also that you would like to support the operation mode “patch”
> by this SmPL script?

I see no reason why such a wording would imply such a thing.

julia
--8323329-1467652441-1578818533=:2552--
