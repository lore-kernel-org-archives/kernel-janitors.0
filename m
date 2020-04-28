From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 28 Apr 2020 06:21:37 +0000
Subject: Re: [PATCH v3] checkpatch: add dedicated checker for 'Fixes:' tag
Message-Id: <35069ae9-cdb4-4728-5e94-6d863dd2721c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428020223.GA28074@udknight>
In-Reply-To: <20200428020223.GA28074@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

> ...
> Do not split the tag across multiple
> lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
> parsing scripts
> ...

I suggest to reformat the quotation.

“…
Do not split the tag across multiple lines, tags are exempt from
the "wrap at 75 columns" rule in order to simplify parsing scripts.
…”


> And there is no 'Fixes:' tag format checker in checkpatch to check
> the commit id length too, so let's add dedicated checker to check
> these conditions for 'Fixes:' tag.

It seems that there are further challenges to consider for an imperative wording
in such a change description.

How do you think about the following wording variant?

   The script “checkpatch.pl” did not provide a check for the commit
   identification length. Thus add a dedicated check.


>  v2-v3

I would find a shorter version identification (without the arrow)
also sufficient.


>  1:No modification to GIT_COMMIT_ID checker.

Would you like to add a space character for the item enumeration?


>    I make a mistake previously, …

Would you like to use the word “made” here?


> +		    my $id = '0123456789ab';
> +		    my $orig_desc = "commit description";

How much do these variable initialisations matter?


> +			$lines = 0 if ($1 =~ /^\(\"(?:.*)\"\)$/i);

I wonder why you see a need to use a non-capturing group in such
a regular expression (when no alternatives were specified there).


> +				ERROR("FIXES_TAG",
> +					"Please use 'Fixes:' tag with commit description style '<12+ chars of sha1> (\"<title line>\")', and the title line doesn't across multiple lines - ie: '$fixes_tag_fmt'\n" . $herecurr);

* Would we like to support any other quotation characters around
  the commit summary?

* I propose to split the error message.
  May it become multi-line?

* How do you think about another wording variant?

  The title must be specified as a single line (without line breaks).

* Would you like to point questionable commit titles out?

Regards,
Markus
