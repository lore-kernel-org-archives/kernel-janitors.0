From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 30 Jun 2020 08:04:27 +0000
Subject: Re: [PATCH v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <3cedcc41-38b2-d17b-3ad5-5a5b8403f953@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
In-Reply-To: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jonathan Corbet <corbet@lwn.net>

> @@ -177,13 +177,13 @@ For example, to check drivers/net/wirele
>  To apply Coccinelle on a file basis, instead of a directory basis, the
>  following command may be used::
>
> -    make C=1 CHECK="scripts/coccicheck"
> +    make C=1 CHECK="scripts/coccicheck" path/to/file.c

Can such information still be questionable according to usual make functionality?

* Do you usually expect that such a source file does not need to be regenerated
  (because it should be up-to-date already according a selected revision)?

* Would you like to trigger the generation of a corresponding source code
  analysis log file (or a “diff”)?

* How do you think about to pass an other parameter to the build target “coccicheck”?

Regards,
Markus
