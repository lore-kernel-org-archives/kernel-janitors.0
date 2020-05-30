From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 30 May 2020 11:40:53 +0000
Subject: Re: [PATCH] checkpatch/coding-style: Allow 100 column lines
Message-Id: <a45357fe-6570-ef20-ed0e-494cdf7a6f1d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Casey Schaufler <casey@schaufler-ca.com>, Christoph Hellwig <hch@lst.de>, David Howells <dhowells@redhat.com>, David Laight <David.Laight@ACULAB.COM>, Ian Kent <raven@themaw.net>, Linus Torvalds <torvalds@linux-foundation.org>

> Change the maximum allowed line length to 100 from 80.
>
> Miscellanea:
>
> o to avoid unnecessary whitespace changes in files,
>   checkpatch will no longer emit a warning about line length
>   when scanning files unless --strict is also used
> o Add a bit to coding-style about alignment to open parenthesis

I suggest to convert this patch into a patch series with three update steps.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=86852175b016f0c6873dcbc24b93d12b7b246612#n138


…
> +++ b/Documentation/process/coding-style.rst
> @@ -84,15 +84,22 @@ …
…
> +… and are
> +are placed …

Please avoid a word duplication here.


> +… to a function open parenthesis.

Wording alternatives:

+is to align descendants to an open parenthesis of a function call.


> +These same rules are …

+The same rules are applied to function headers with a long argument list.


Regards,
Markus
