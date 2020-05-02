From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 02 May 2020 19:40:24 +0000
Subject: Re: [PATCH v4] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <6a3a6f8d-e8be-0002-780d-1991f6152c8f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200502185421.GB9082@udknight>
In-Reply-To: <20200502185421.GB9082@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

> The check doesn't support below formats and it will emit diagnostics info for them:
…
> Fixes: ba35f8588f47 (“ipvlan: Defer multicast / broadcast processing to a work-queue”)
…
> Fixes: 03f6fc6de919 ('ASoC: rt5682: Add the soundwire support')

Will the tolerance (and support) grow for such quotation character alternatives?


> Note: this patch also fixes double quotation mark issue for normal git
>       commit description, and now it supports double quotation mark in
>       title line, for example:
>       Commit e33e2241e272 ("Revert "cfg80211: Use 5MHz bandwidth by default
>       when checking usable channels"")

Do you care to achieve a safe data format description also for this use case?


> Note: this patch also adds diagnostics info support for normal git commit
>       description format check.

Does this information indicate a need to split possible changes into
separate update steps?


> +				$diagnostics .= "Missing a pair of parentheses '()' or a pair of double quotation marks (\"\").\n";

Can such a message trigger any more thoughts and development ideas?


> +					$diagnostics .= "The title is too abbreviated, at least half of orignial commit title is necessary.\n";

* Please avoid a typo in this message.

* Which formula do you propose for the length calculation?

Regards,
Markus
