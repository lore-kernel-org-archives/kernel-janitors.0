From: Nicolas Palix <nicolas.palix@imag.fr>
Date: Mon, 06 May 2013 20:57:48 +0000
Subject: Re: [PATCH] scripts: Coccinelle script for pci_free_consistent()
Message-Id: <CAAxaTiObus51g_W5Yei87TD9rLO3LyQgnmf+bHnH8x3AQVgc=Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
In-Reply-To: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Could you add the Coccinelle mailing list, the main Linux kernel mailing list
and Michal Marek in copy of your resubmission? So Julia will only have
to Ack your
patch.

BTW thanks for your welcome contribution.

Regards,

On Thu, May 2, 2013 at 2:57 AM, Julia Lawall <julia.lawall@lip6.fr> wrote:
> On Thu, 2 May 2013, strnape1@fel.cvut.cz wrote:
>
>> Created coccinelle script for reporting missing pci_free_consistent() calls.
>>
>> Signed-off-by: Petr Strnad <strnape1@fel.cvut.cz>
>> ---
>> diff --git a/scripts/coccinelle/free/pci_free_consistent.cocci
>> b/scripts/coccinelle/free/pci_free_consistent.cocci
>> new file mode 100644
>> index 0000000..9d9a56f
>> --- /dev/null
>> +++ b/scripts/coccinelle/free/pci_free_consistent.cocci
>> @@ -0,0 +1,44 @@
>> +/// Find missing pci_free_consistent for every pci_alloc_consistent.
>> +///
>> +// Confidence: Moderate
>> +// Copyright: (C) 2013 Petr Strnad.  GPLv2.
>> +// URL: http://coccinelle.lip6.fr/
>> +// Keywords: pci_free_consistent, pci_alloc_consistent
>> +// Options: --no-includes --include-headers
>> +
>> +virtual report
>> +
>> +@search@
>> +local idexpression id;
>> +expression x,y,z;
>> +position p1,p2;
>> +@@
>> +
>> +id = pci_alloc_consistent@p1(x,y,&z)
>> +... when != pci_free_consistent(x,y,id,z)
>> +    when forall
>> +(
>> +if (id = NULL) { ... return ...; }
>> +|
>> +if (id = NULL || (unsigned long)id & 0xFF) { ... return ...; }
>
> The above two lines can be combined into if (id = NULL || ....) { ...
> return ...; }
>
>> +|
>> +if (id = NULL) return ...;
>
> This case shouldn't be necessary.  It should automatically consider { ...
> return ...; } as also matching return ...; (isomorphism).
>
>> +|
>> +if (id) { ... return 0; }
>> +|
>> +if (id) { ... } else { ... } return 0;
>
> Here, I would put S1 and S2, declared as statement metavariables, rather
> than { ... }
>
> julia
>
>> +|
>> +return 0;
>> +|
>> +return id;
>> +|
>> +*return@p2 ...;
>> +)
>> +
>> +@script:python depends on report@
>> +p1 << search.p1;
>> +p2 << search.p2;
>> +@@
>> +
>> +msg = "ERROR: missing pci_free_consistent; pci_alloc_consistent on line %s
>> and return without freeing on line %s" % (p1[0].line,p2[0].line)
>> +coccilib.report.print_report(p2[0],msg)
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Nicolas Palix
