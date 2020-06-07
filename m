From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 07 Jun 2020 06:42:42 +0000
Subject: Re: Coccinelle: Improving software components around usage of SmPL disjunctions
Message-Id: <e06c858b-80fe-9d7c-be48-882162a414fe@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
 <alpine.DEB.2.21.2006060944320.2578@hadrien>
 <51a176d4-8c59-5da1-b4d2-c97b17b691a7@web.de>
 <alpine.DEB.2.21.2006061307020.2578@hadrien>
 <bf698c44-4384-e471-3ff0-e38587140b98@web.de>
In-Reply-To: <bf698c44-4384-e471-3ff0-e38587140b98@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>> But hiding information that could be apparent to the SmPL compiler
>> and could be used to improve the performance of the matching
>> process is not one of them.
>
> Will any software extensions become possible also in this area?

You pointed out that SmPL disjunctions can trigger specific consequences
according to functionality which is different from SmPL constraints.
Both application areas support data processing for function name lists
to some degree.
Each element of a SmPL disjunction refers to a fragment of a detailed
source code search pattern. We are discussing use cases where a search
pattern is occasionally restricted in the way that only identifiers
should be found at a specific place.

* Does this detail provide the opportunity to improve the corresponding
  software any more?

* Can a feature request like “Working with variables for case match
  identification by SmPL disjunctions” become more interesting?
  https://github.com/coccinelle/coccinelle/issues/159

Regards,
Markus
