From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 27 Apr 2020 14:00:43 +0000
Subject: Re: [PATCH] checkpatch: add dedicated checker for 'Fixes:' tag
Message-Id: <c8960fa6-c69c-3779-aaf2-b6ef14671a63@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andy Whitcroft <apw@canonical.com>

> length, so I think it is better to add dedicated checker for 'Fixes:' TAG.

I suggest to reconsider also this wording once more.


…
> +++ b/scripts/checkpatch.pl
> @@ -2820,7 +2820,7 @@ sub process {
…
> +				ERROR("FIXES_TAG",
> +					"please use the 'Fixes:' tag with the first 12 characters of the SHA-1 ID, and the one line summary(no across multiple lines)\n" . $herecurr);

* Would you like to take another information better into account?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=6a8b55ed4056ea5559ebe4f6a4b247f627870d4c#n177

  “…
  You should also be sure to use at least the first twelve characters …
  …”

* Is the information questionable also from the parenthesised text
  in the error message from the Perl code?

Regards,
Markus
