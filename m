From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 27 Apr 2020 16:50:21 +0000
Subject: Re: [PATCH v2] checkpatch: add dedicated checker for 'Fixes:' tag
Message-Id: <0bded90c-cc66-bd12-7192-4bd75e72f678@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427145332.GA18830@udknight>
In-Reply-To: <20200427145332.GA18830@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andy Whitcroft <apw@canonical.com>

> According to submitting-patches.rst, …

I find that the reference to this document can trigger further considerations
also for this evolving change description.


> "
> Do not split the tag across multiple
> lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
> parsing scripts
> "

Can it be nicer to use typographic quotation characters together with ellipses?


> And the current 'Fixes:' checker in "# Check for git id commit length and
> improperly formed commit descriptions" doesn't check for invalid commit id

Should this “link” refer to a known check name?


> length, so this patch adds dedicated checker to fix these issues.

Would you care to transform this information into an imperative wording?


…
> +++ b/scripts/checkpatch.pl
> @@ -2820,7 +2820,7 @@ sub process {
…
> -		      $line !~ /\bfixes:\s*[0-9a-f]{12,40}/i))) {
> +		      $line !~ /^\s*fixes:\s*(?:[0-9a-f]{6,40})\s*(?:.*)/i))) {

I guess that the clarification around the relevance of word boundaries
will become also more interesting.

Will it become relevant to check if a provided change identification
can actually be resolved to the desired commit?


> @@ -2979,6 +2979,13 @@ sub process {
…
> +				ERROR("FIXES_TAG",
> +					"please use the 'Fixes:' tag with at least the first 12 characters of the SHA-1 ID, and the one line summary(no across multiple lines)\n" . $herecurr);

* How do you think about to start this message with the word “Please”?

* Is the text “summary(no across” still questionable?

* Will there be a need to explicitly describe the data format
  for the summary specification also at this place?

Regards,
Markus
