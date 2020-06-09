From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 09 Jun 2020 09:36:02 +0000
Subject: Re: [PATCH v2 4/4] coccinelle: api: add selfcheck for memdup_user rule
Message-Id: <675f3bc3-99f4-1780-af04-cf7de2e9059a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1034b7b-12f9-a4c7-868e-1579668eb73e@web.de>
In-Reply-To: <d1034b7b-12f9-a4c7-868e-1579668eb73e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

…
> +++ b/scripts/coccinelle/api/memdup_user.cocci
> @@ -14,13 +14,24 @@ virtual patch
>  virtual context
>  virtual org
>  virtual report
> +virtual selfcheck

Would you like to avoid the repetition of a SmPL key word here?

+virtual patch, context, org, report, selfcheck


> @@ -117,3 +128,34 @@ p << rv.p;
>  @@
>
>  coccilib.report.print_report(p[0], "WARNING opportunity for vmemdup_user")
> +
> +@script:python depends on selfcheck@
> +@@
> +coccinelle.checked_files |= set(definitions.values()) & set(cocci.files())

I suggest to reconsider the usage of the function “cocci.files()”.
Can such a script rule determine for which file it should perform data processing?


> +            print('SELF-CHECK: the pattern no longer matches ' \
> +		  'definitions {} in file {}'.format(not_found, efile))

Can the following code variant be a bit nicer?

+            sys.stdout.write('SELF-CHECK: The pattern does not match definitions {} in file {} any more.\n' \
+                             .format(not_found, efile))


Regards,
Markus
