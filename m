From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 01 Jul 2020 20:10:14 +0000
Subject: Re: [v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <5e83b473-8764-fbfc-394c-1acffa74943c@web.de>
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
In-Reply-To: <05f8cb2b-c76e-e2ba-24a8-5676c1792255@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>

>> Did you test the specified make command for the display
>> of expected data processing results?
>
> Markus, if something doesn't work, just say so, OK?

Did a previous information fit to this expectation already?
https://lore.kernel.org/linux-doc/c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de/
https://lkml.org/lkml/2020/6/30/492

“…
make: Nothing to be done for 'path/to/file.c'.
…”


> Don't go all obtuse on us.

I am curious if involved communication difficulties can be resolved
better by other means.


>> How much do you distinguish desired effects according to
>> the specification of file extensions for such build commands?
>
> I don't grok that.

I assume that you got used to the handling of specific file suffixes
also for their application together with make scripts.

One part of the discussed software documentation deals with
the combination of compilation and further source code analysis,
doesn't it?


> Julia, Markus- can you tell me how to run coccicheck on one source file?

You can choose between two methods.

* Use the documented build target with appropriate parameters.
  (How many Linux software modules do consist of only a single source file?)

* Do you get further ideas from another concrete command example?
  https://lore.kernel.org/linux-arm-kernel/5b693ee0-0cb1-7ff3-b562-bac6bcb6aae8@web.de/
  https://lkml.org/lkml/2020/6/29/357

  elfring@Sonne:~/Projekte/Linux/next-patched> make J=1 C=1 CHECK='scripts/coccicheck' MODE=context COCCI=~/Projekte/Linux/next-patched/scripts/coccinelle/null/show_pointer_usage_before_null_check-20200701.cocci drivers/usb/mtu3/mtu3_gadget.o

Regards,
Markus
