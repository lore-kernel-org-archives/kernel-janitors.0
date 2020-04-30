From: Joe Perches <joe@perches.com>
Date: Thu, 30 Apr 2020 15:41:18 +0000
Subject: Re: [PATCH] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <30efd2838a876029600806e9b53e3284ccabc88d.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429163645.GA13810@udknight>
         <4112ab7e-1f06-d880-e471-084c78bc84d4@web.de>
         <20200430125614.GA30691@udknight>
In-Reply-To: <20200430125614.GA30691@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Markus Elfring <Markus.Elfring@web.de>
Cc: Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

On Thu, 2020-04-30 at 20:56 +0800, Wang YanQing wrote:
> On Wed, Apr 29, 2020 at 07:40:21PM +0200, Markus Elfring wrote:
> > > “...
> > > Do not split the tag across multiple
> > > lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
> > > parsing scripts
> > > ...”
> > 
> > Why do you not like the reformatting of the quotation so far
> > (if such change descriptions should cope also with specific
> > Unicode characters)?
> > 
> > “…
> > Do not split the tag across multiple lines, tags are exempt from
> > the "wrap at 75 columns" rule in order to simplify parsing scripts.
> > …”
> > 
> > 
> 
> Sigh. I will fix it, but I want to hear from Joe Perches before
> next patch version.

Hello YanQing.

Just ignore Markus' replies here, he's well meaning
but perhaps overly focused on trying to impose formal,
but somewhat antique grammar and word choice uses that
aren't particularly important for review.

The most common variant I see here is someone writes

Fixes: SHA1 ("Truncated commit description...")

to apparently avoid a long line.

btw:

you can test your patch using checkpatch and --git like:

$ git log -10000 --no-merges --grep="Fixes:" --format=%H | \
  while read commit ; do \
    ./scripts/checkpatch.pl --git $commit --types=GIT_COMMIT_ID --quiet --nosummary; \
  done

You could filter that either by modifying the patch
changing to "GIT_COMMIT_ID_TEST" and changing to
types=GIT_COMMIT_ID_TEST just for Fixes or maybe
use another grep like grep -B3 -A3 "Fixes:" -i
