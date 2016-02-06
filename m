From: Kevin Wern <kevin.m.wern@gmail.com>
Date: Sat, 06 Feb 2016 21:24:38 +0000
Subject: Re: [PATCH] checkpatch.pl: fix naked sscanf false positives
Message-Id: <CANtyZjQqnvU60Mc_cJcrtWYZvRFBsgTz-CLehT8qX0erDo4J_g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160205082952.GA18361@kwern-VirtualBox>
In-Reply-To: <20160205082952.GA18361@kwern-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sorry, I think the Andy thing was the gmail client auto-filling contacts when I
reply all...

On Sat, Feb 6, 2016 at 9:20 AM, Joe Perches <joe@perches.com> wrote:
>
> It's a single line sscanf vs multi-line sscanf issue
>
> $line works on
>         ret = sscanf(buf, &foo, &bar);
>
> $stat works on that and
>         ret = sscanf(buf,
>                      &foo,
>                      &bar);
>

Ah, ok. I dont think having just the ending paren will work though because the
paren can be on the next line, so the pre-patch statement is most correct.
What we should do, then, is something like:

        [snip]
        $line =~ /\bsscanf\b/ &&
-       ($stat !~ /$Ident\s*=\s*sscanf\s*$balanced_parens/ &&
+       ($stat =~ /\bsscanf\b\s*$balanced_parens/ &&
+       $stat !~ /$Ident\s*=\s*sscanf\s*$balanced_parens/ &&
        $stat !~ /\bsscanf\s*$balanced_parens\s*(?:$Compare)/ &&
        $stat !~ /(?:$Compare)\s*\bsscanf\s*$balanced_parens/)) {
        [snip]

That way, we know we are evaluating a sscanf on the current line, but also
ensure that it is a function call in the current statement.

Would this work?  It seems to on my end.

I can send over the amended patch.

- Kevin
