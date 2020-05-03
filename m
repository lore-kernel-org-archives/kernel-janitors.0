From: Wang YanQing <udknight@gmail.com>
Date: Sun, 03 May 2020 14:37:01 +0000
Subject: Re: [PATCH v5] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <20200503143700.GA12276@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200503122938.GC10332@udknight>
 <2d13b5c1-6745-23da-e22d-d56f0644edb2@web.de>
In-Reply-To: <2d13b5c1-6745-23da-e22d-d56f0644edb2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

On Sun, May 03, 2020 at 03:51:39PM +0200, Markus Elfring wrote:
> 
> 
> …
> > +					$diagnostics .= "The title is too abbreviated, at least half of orignial commit title is necessary.\n";
> 
> Will the word “original” be more appropriate here?
> (Why did you not integrate my previous patch review comment?)

Sorry, I miss it.

This version patch has indentation issue, I will fix the typo
with the indentation issue in next version (v6).

Thanks.

> 
> 
> …
> > +				      "Please use git commit description style '$prefix <$sha1_length_min+ chars of sha1> (\"<$title>\")' - ie: '${init_char}" . substr($prefix, 1) .
> > +				      " $id (\"$description\")'\n" . $diagnostics . $herecurr);
> 
> Can error diagnostics become multi-line?
The length of "$description" is unknown, it is difficult to
cook the error message into pretty format with any length of
"$description", so let's keep it in current way.

Thanks.
