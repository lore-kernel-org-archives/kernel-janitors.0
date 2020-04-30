From: Wang YanQing <udknight@gmail.com>
Date: Thu, 30 Apr 2020 12:56:14 +0000
Subject: Re: [PATCH] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <20200430125614.GA30691@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429163645.GA13810@udknight>
 <4112ab7e-1f06-d880-e471-084c78bc84d4@web.de>
In-Reply-To: <4112ab7e-1f06-d880-e471-084c78bc84d4@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

On Wed, Apr 29, 2020 at 07:40:21PM +0200, Markus Elfring wrote:
> > “...
> > Do not split the tag across multiple
> > lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
> > parsing scripts
> > ...”
> 
> Why do you not like the reformatting of the quotation so far
> (if such change descriptions should cope also with specific
> Unicode characters)?
> 
> “…
> Do not split the tag across multiple lines, tags are exempt from
> the "wrap at 75 columns" rule in order to simplify parsing scripts.
> …”
> 
>

Sigh. I will fix it, but I want to hear from Joe Perches before
next patch version.

> 
> > And there is no sanity check for 'Fixes:' tag format in checkpatch the same
> > as GIT_COMMIT_ID for git commit description, so let's expand the GIT_COMMIT_ID
> > to add 'Fixes:' tag format check support.
> 
> I have got the impression that this wording might need another bit
> of fine-tuning.

The current wording is enough I think.

> 
> 
> > +				      "Please use git commit description style '$prefix <12+ chars of sha1> (\"<$title>\")' - ie: '${init_char}" . substr($prefix, 1) . " $id (\"$description\")'\n" . $herecurr);
> 
> I imagine that the support for different quotation characters
> can become helpful, can't it?

No, we don't need to support other quotation character for 'Fixes:' tag
at least now. The submitting-patches.rst tells us the pretty format is:
“...
Fixes: %h (\"%s\")
...”

> 
> Regards,
> Markus

Thanks.
