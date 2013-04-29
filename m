From: strnape1@fel.cvut.cz
Date: Mon, 29 Apr 2013 21:06:14 +0000
Subject: Re: [PATCH] scripts: Coccinelle script for pci_free_consistent()
Message-Id: <20130429230614.Horde.z3bC6yhdt20ppkpNotGwIg2@wimap.feld.cvut.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
In-Reply-To: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Should I resubmit the patch with the proper file, or create a patch to  
"patch" the one I already submited then?
Quoting Julia Lawall <julia.lawall@lip6.fr>:

> Actually, you don't support org or patch mode.  So you should get rid of
> the corresponding virtual declarations at the top of the rule.  You could
> also add an Options line at the top with --no-includes --include-headers,
> since you don't need to include any header files for this rule, but the
> rule might apply within a header file.
>
> julia
>
> On Sun, 28 Apr 2013, strnape1@fel.cvut.cz wrote:
>
>> Created coccinelle script for reporting missing pci_free_consistent() calls.
>>
>> Signed-off-by: Petr Strnad <strnape1@fel.cvut.cz>
>> ---
>> diff --git a/scripts/coccinelle/free/pci_free_consistent.cocci
>> b/scripts/coccinelle/free/pci_free_consistent.cocci
>> new file mode 100644
>> index 0000000..08ea45a
>> --- /dev/null
>> +++ b/scripts/coccinelle/free/pci_free_consistent.cocci
>> @@ -0,0 +1,36 @@
>> +/// Find missing pci_free_consistent for every pci_alloc_consistent.
>> +///
>> +// Copyright: (C) 2013 Petr Strnad.  GPLv2.
>> +// URL: http://coccinelle.lip6.fr/
>> +//
>> +// Keywords: pci_free_consisten, pci_alloc_consistent
>> +//
>> +
>> +virtual context
>> +virtual patch
>> +virtual org
>> +virtual report
>> +
>> +@search@
>> +expression id,x,y,z;
>> +position p1,p2;
>> +@@
>> +
>> +<...
>> +id = pci_alloc_consistent@p1(x,y,z)
>> +... when != pci_free_consistent(x,y,id,z)
>> +    when forall
>> +(
>> +if (id = NULL) { ... }
>> +|
>> +*return@p2 ...;
>> +)
>> +...>
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
>> To unsubscribe from this list: send the line "unsubscribe  
>> kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html



