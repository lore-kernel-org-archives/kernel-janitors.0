From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 23 Sep 2019 11:17:46 +0000
Subject: Re: [Cocci] Reducing source code around return statements with SmPL?
Message-Id: <60d48f4c-e187-6bdd-432b-9101888e7464@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e07ce253-8a13-0f90-3ee0-79c1a0e78b38@web.de>
 <alpine.DEB.2.21.1909231058380.2283@hadrien>
In-Reply-To: <alpine.DEB.2.21.1909231058380.2283@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Coccinelle <cocci@systeme.lip6.fr>
Cc: kernel-janitors@vger.kernel.org

>> The following small script for the semantic patch language
>> can point various source code places out for further considerations.
>>
>> @replacement@
>> expression x;
>> identifier rc;
>
> Add: local idexpression lrc;
>
>> @@
>> -rc = x;
>
> Replace by - lrc@rc = x;
>
> julia
>
>>  return
>> -       rc
>> +       x
>>  ;

Thanks for your advice.


>> Which adjustments should be taken better into account for this use case?

The shown metavariable combination is interesting, isn't it?
2064 Linux source files are pointed out by this transformation approach.

* Does this number need any additional thoughts?

* Will it become helpful to integrate such a SmPL script
  into a corresponding Linux directory?

Regards,
Markus
