From: Jeff Moyer <jmoyer@redhat.com>
Date: Thu, 07 Jun 2012 14:24:46 +0000
Subject: Re: [PATCH 4/7] fs/direct-io.c: adjust suspicious bit operation
Message-Id: <x49bokvb3o1.fsf@segfault.boston.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr>
	<1339018901-28439-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1339018901-28439-5-git-send-email-Julia.Lawall@lip6.fr> (Julia
	Lawall's message of "Wed, 6 Jun 2012 23:41:38 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com, Julia Lawall <julia@diku.dk>

Julia Lawall <Julia.Lawall@lip6.fr> writes:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> READ is 0, so the result of the bit-and operation is 0.  Rewrite with = as
> done elsewhere in the same file.
>
> This problem was found using Coccinelle (http://coccinelle.lip6.fr/).

Interesting catch, that one.  Yeah, we don't expect any readahead I/O to
be done via O_DIRECT.  The test for rw = READ all over that file seems
fine to me, given that.

Reviewed-by: Jeff Moyer <jmoyer@redhat.com>
