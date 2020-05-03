From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 May 2020 12:32:26 +0000
Subject: Re: [v4] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <975e6172-b333-37ab-ccc7-9e9a85986dfe@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200502185421.GB9082@udknight>
 <6a3a6f8d-e8be-0002-780d-1991f6152c8f@web.de>
 <20200503114557.GA10332@udknight>
In-Reply-To: <20200503114557.GA10332@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

>>> +				$diagnostics .= "Missing a pair of parentheses '()' or a pair of double quotation marks (\"\").\n";
>>
>> Can such a message trigger any more thoughts and development ideas?
>
> No, I don't think so. '(" ... ")' is the minimum interface between analyser
> (checkpatch) and commit id description (normal commit id and 'Fixes:' tag)

* I am proposing to recheck the influence of quotation character alternatives
  also at this place.

* How do you think about to provide an information without the word “or”
  in error messages?


> about the title, it is very difficult if not impossible to guess the title
> boundary and whether it is the *REAL* title that folllow the SHA1 without
> this precondition,

I find this concern reasonable.


> and it is more difficult to do it when we need to support
> title which across lines in the normal commit id description.

I imagine that further software design options can be considered.


> At last I really doubt the benefit it brings deserves the complexity and the
> current diagnostics info is enough clear for most situation.

* Will a safer data format description trigger corresponding efforts?

* Will the structure of the commit title matter?

* Would you like to improve checks (and program organisation) besides
  the application of regular expressions?

Regards,
Markus
