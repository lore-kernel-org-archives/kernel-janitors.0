From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Oct 2017 08:48:01 +0000
Subject: Re: [PATCH] um: Use common error handling code in port_listen_fd()
Message-Id: <20171023084800.p26qcpb7iqyqrz4v@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b16407cf-0caa-ea1d-7997-0e9a231468f3@users.sourceforge.net>
In-Reply-To: <b16407cf-0caa-ea1d-7997-0e9a231468f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: user-mode-linux-devel@lists.sourceforge.net, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, user-mode-linux-user@lists.sourceforge.net, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

This business of moving the error code to the bottom of the function
just makes the code less readable.  I know you never listen to anyone,
but you should stop doing it.

regards,
dan carpenter

