From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Dec 2014 21:43:02 +0000
Subject: Re: [PATCH] scripts: coccinelle: add uses of memzero_explicit
Message-Id: <5488BE66.8040804@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1418242123-8610-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1418242123-8610-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> Memzero_explicit is a version of memset that is resistent to compiler
> optimizations when the set region is about to go out of scope.

Thanks for another interesting update suggestion.


> This was suggested by Daniel Borkmann

How do you think about to amend such a commit message here?

Would it eventually be better to use a tag like "Suggested-by" there
(instead of finishing this sentence with a full stop)?

Regards,
Markus
