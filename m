From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 05 Oct 2019 12:26:08 +0000
Subject: Re: [Cocci] [RFC] scripts: Fix coccicheck failed
Message-Id: <alpine.DEB.2.21.1910051425050.2653@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1481532127-1570278369=:2653"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAS2K6i+s2A_xTyRq730M6_=tyjtfwHAnEHF37_nrJa4Eg@mail.gmail.com>
 <21684307-d05c-1856-c849-95436aedeb86@web.de>
In-Reply-To: <21684307-d05c-1856-c849-95436aedeb86@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Yue Haibing <yuehaibing@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Matthias_M=E4nnich?= <maennich@google.com>, Jessica Yu <jeyu@kernel.org>, Martijn Coenen <maco@android.com>, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1481532127-1570278369=:2653
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sat, 5 Oct 2019, Markus Elfring wrote:

> > You gave Acked-by to the one-liner fix "virtual report",
>
> It was (temporarily?) accepted to use the script “add_namespace.cocci”
> without such a type of SmPL variable.
>
>
> > and I am happy to apply it to my tree.
>
> Would you like to take the change possibility into account
> that the coccicheck system configuration should be adapted instead?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccicheck?id=4ea655343ce4180fe9b2c7ec8cb8ef9884a47901#n257

I prefer the one line change for now.  If more issues arise one can see
what is more desirable at a larger scale.

julia

>
> Regards,
> Markus
>
--8323329-1481532127-1570278369=:2653--
