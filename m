From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Sep 2016 07:45:30 +0000
Subject: Re: [PATCH v2 3/3] Input-gameport: Replace some printk() calls by pr_info() in joydump_connect()
Message-Id: <b735e40a-4fd2-fcc5-0c55-357ba1e4360f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8da8333-d83a-ca61-b887-7fd7528c63a4@users.sourceforge.net>
 <f486d64d-0759-9cd6-1e4e-df723acb6fea@users.sourceforge.net>
 <1474733610.23838.2.camel@perches.com>
 <814f7993-de4b-05d8-845e-3f0230122061@users.sourceforge.net>
 <1474788689.2238.3.camel@perches.com>
In-Reply-To: <1474788689.2238.3.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> This is not a good change as it messes with dmesg timestamps.

Thanks for your quick feedback.

Have you got any more concerns around multi-line text output?


> Simpler to read and more straightforward is multiple
> individual function calls.

Will it become feasible to pass the desired data also only
by one logging call directly?

Regards,
Markus
