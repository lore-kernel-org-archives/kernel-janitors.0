From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 May 2020 13:51:39 +0000
Subject: Re: [PATCH v5] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <2d13b5c1-6745-23da-e22d-d56f0644edb2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200503122938.GC10332@udknight>
In-Reply-To: <20200503122938.GC10332@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

> “...

Can the character “Horizontal ellipsis” (U+2026) be occasionally nicer
instead of three separate dots?


> The check supports below formats:

I would prefer the explicit wording for the support of (Unicode) ellipses
also in the shown commit titles.
Will the document “submitting-patches.rst” need corresponding adjustments?


> Because after GIT_COMMIT_ID supports 'Fixes:' tag format check, it could do
> the same check as the UNKNOWN_COMMIT_ID, so we don't need UNKNOWN_COMMIT_ID
> anymore and I decide to delete it.

Would you like to propose related software adjustments?


> Note: this patch also fixes double quotation mark issue for normal git
>       commit description, and now it supports double quotation mark in
>       title line, for example:
>       Commit e33e2241e272 ("Revert "cfg80211: Use 5MHz bandwidth by default
>       when checking usable channels"")

Do you care to achieve a safer data format description also for this use case?


>  This is the v5 version, and I have tested it with below command:

How do you think about to reuse the analysis approach outside
the script “checkpatch.pl”?


>  v5:
>  1: Rebased on '[PATCH v2] checkpatch: fix can't check for too long invalid commit id'.

Are the software dependencies (and corresponding development challenges) growing?


…
> +++ b/scripts/checkpatch.pl
> @@ -2818,51 +2818,101 @@ sub process {
…
> +		     $line =~ /\bfixes:\s+[0-9a-f]{5,}\b/i ||

Would you like to reconsider the program organisation according to
the application of regular expressions?


…
> +			if (defined($id) && $has_parens_and_dqm && ($orig_desc ne $description)) {
> +			    # Allow short description without too short!

Will another wording adjustment become relevant here?


> +			    if ($prefix eq "Fixes:") {
> +				if (length($orig_desc) >= length($description)/2) {

Will the structure of the commit title matter any more?


…
> +					$diagnostics .= "The title is too abbreviated, at least half of orignial commit title is necessary.\n";

Will the word “original” be more appropriate here?
(Why did you not integrate my previous patch review comment?)


…
> +				      "Please use git commit description style '$prefix <$sha1_length_min+ chars of sha1> (\"<$title>\")' - ie: '${init_char}" . substr($prefix, 1) .
> +				      " $id (\"$description\")'\n" . $diagnostics . $herecurr);

Can error diagnostics become multi-line?

Regards,
Markus
