From: Joe Perches <joe@perches.com>
Date: Fri, 20 Oct 2017 18:06:43 +0000
Subject: Re: [PATCH] um: Use common error handling code in port_listen_fd()
Message-Id: <1508522803.30181.3.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b16407cf-0caa-ea1d-7997-0e9a231468f3@users.sourceforge.net>
In-Reply-To: <b16407cf-0caa-ea1d-7997-0e9a231468f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, user-mode-linux-devel@lists.sourceforge.net, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>
Cc: user-mode-linux-user@lists.sourceforge.net, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 2017-10-20 at 19:29 +0200, SF Markus Elfring wrote:
> arch/um/drivers/port_user.c

If you are going to use multiple labels,
it'd be nicer to rename out: too.

