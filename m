From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 05 Sep 2019 14:23:35 +0000
Subject: Re: [RFC PATCH] coccinelle: check for integer overflow in binary search
Message-Id: <a9fabfbe-d75e-ef40-c5e6-946c52344308@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904221223.5281-1-efremov@linux.com>
In-Reply-To: <20190904221223.5281-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org

> +@@
> +(
> + while (\(…\)) {
…
> + }

It seems that compound statements are mainly checked for
control flow statements by this source code search approach
so far.
Would you like to handle also single statements (without the
curly brackets)?
(Will additional SmPL disjunctions be needed then?)


> +statement S;
…
> +|
> + for (...; \(…\);
> +      m = \(…\)) S

* Can the metavariable “S” look nicer on a separate line?

* Should assignments be taken into account for more variables?


> +|
> + for (...; \(…\); ...) {
> + }
> +)

I find the shown case distinction incomplete.
Will loop initialisations trigger further SmPL development challenges?

Regards,
Markus
