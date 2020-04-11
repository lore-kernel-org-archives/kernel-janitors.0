From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Apr 2020 07:13:49 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <af3166a9-c463-2645-05c5-441cc87abb6c@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
 <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
 <6e52383e-100d-b016-32c2-6fb54938b6fe@wanadoo.fr>
 <c9fd4bc75812fed4799c2fb87b452b809a7e9a7a.camel@perches.com>
 <db2730700ab3eb7008413a1e7bba94ca7c49a031.camel@perches.com>
 <26b49cf5-453b-9a81-b045-fdc99c42fcf8@wanadoo.fr>
In-Reply-To: <26b49cf5-453b-9a81-b045-fdc99c42fcf8@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Le 11/04/2020 à 09:12, Christophe JAILLET a écrit :
>
> Hi,
>
>     ./scripts/checkpatch.pl -f drivers/soc/kendryte/k210-sysctl.c
>
> is missing line 189, even if it looks like a construction correctly 
> spotted in some other files:
>     if (foo) {
>         dev_err(...);
>         ...
>     };
>
> CJ
>
>
Oops, my mistake, this one is correctly spotted :)

CJ
