From: Randy Dunlap <rdunlap@infradead.org>
Date: Wed, 01 Jul 2020 19:15:13 +0000
Subject: Re: [v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <05f8cb2b-c76e-e2ba-24a8-5676c1792255@infradead.org>
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
In-Reply-To: <bd4033cd-f564-0414-4dbf-4ff58f841648@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On 7/1/20 10:32 AM, Markus Elfring wrote:
>> None of that has anything to do with the current patch.
> 
> Did you test the specified make command for the display
> of expected data processing results?

Markus, if something doesn't work, just say so, OK?
Don't go all obtuse on us.

> How much do you distinguish desired effects according to
> the specification of file extensions for such build commands?

I don't grok that.


@Jon, Julia-
I plan to submit a v3 without the addition of "path/to/file.c" in 2 places.


However, I thought that this:
  To apply Coccinelle on a file basis, instead of a directory basis, the
  following command may be used::

    make C=1 CHECK="scripts/coccicheck"

meant that someone could run coccicheck on one source file, but I cannot
get that to work.

Julia, Markus- can you tell me how to run coccicheck on one source file?


Thanks.
-- 
~Randy
