From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Sep 2012 08:53:41 +0000
Subject: Re: [PATCH] include/linux: Fix spelling of "usage" in comment.
Message-Id: <20120920085341.GY4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348105682-25196-2-git-send-email-adam.buchbinder@gmail.com>
In-Reply-To: <1348105682-25196-2-git-send-email-adam.buchbinder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The subject on this should be:
[PATCH] kexec: Fix spelling of "usage" in comment.

You should CC the kexec people as well, in case they want to pick
this up instead of going through the trivial tree.  The way to find
that is:

./scripts/get_maintainer.pl -f include/linux/kexec.h

Eric Biederman <ebiederm@xmission.com> (maintainer:KEXEC)
kexec@lists.infradead.org (open list:KEXEC)

No need to CC lkml.

regards,
dan carpenter

