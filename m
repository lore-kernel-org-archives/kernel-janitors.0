From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Sep 2016 07:33:29 +0000
Subject: Re: [PATCH 12/16] md/bitmap: One check less in read_page() at the end
Message-Id: <20160928073329.GZ13620@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <30938c84-20a7-0f13-bdda-a2d2109a6dac@users.sourceforge.net>
 <18d73bcc-795b-8680-c82c-9a06047a8ef3@users.sourceforge.net>
In-Reply-To: <18d73bcc-795b-8680-c82c-9a06047a8ef3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-raid@vger.kernel.org, Shaohua Li <shli@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

This makes the code ugly.

regards,
dan carpenter

