From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 02 Jul 2020 08:22:27 +0000
Subject: Re: [v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <0b4bdb33-2b67-bc08-cfc1-0cd82c8551d0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
 <c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de>
 <efc8b0c9-db3b-3c9c-d876-897b53a9e278@infradead.org>
 <2a3940de-6a81-1aff-8109-53c1c5a6aa1b@web.de>
 <f2aaa91a-f935-bc2d-26f2-712576c1bbd7@infradead.org>
 <2f80fb10-dc7f-29be-dc3e-2715f8bafc6d@web.de>
 <dfa2ed9f-fe68-58d1-c3d0-ac436f9bee09@infradead.org>
 <648d287e-3636-1858-1439-103d317f8571@web.de>
 <34065299-03cf-5b62-db37-0acc9830be72@infradead.org>
 <65db3f88-1ac8-374d-e3fe-2ea0970ffd67@web.de>
 <30b722ca-1bd8-2b96-ca41-1e9bc7212b66@infradead.org>
 <bd4033cd-f564-0414-4dbf-4ff58f841648@web.de>
 <05f8cb2b-c76e-e2ba-24a8-5676c1792255@infradead.org>
 <5e83b473-8764-fbfc-394c-1acffa74943c@web.de>
 <alpine.DEB.2.22.394.2007012232510.2540@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2007012232510.2540@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Randy Dunlap <rdunlap@infradead.org>, Coccinelle <cocci@systeme.lip6.fr>, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>

>>   elfring@Sonne:~/Projekte/Linux/next-patched> make J=1 C=1 CHECK='scripts/coccicheck' MODE=context COCCI=~/Projekte/Linux/next-patched/scripts/coccinelle/null/show_pointer_usage_before_null_check-20200701.cocci drivers/usb/mtu3/mtu3_gadget.o
>
> This is not what is intended.  What is intended has never worked.  The
> coccicheck script expects that the file name is received on its command
> line, and that is not the case.

I suggest to take another look at information from the verbose execution variant
for such a command example.

* Do the generated program calls look more appropriate then?

* Are you still missing any relevant data (or corresponding descriptions)?

Regards,
Markus
