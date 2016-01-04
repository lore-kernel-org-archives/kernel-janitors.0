From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jan 2016 09:38:29 +0000
Subject: Re: [PATCH 1/3] rsi: Delete unnecessary variable initialisations in rsi_send_mgmt_pkt()
Message-Id: <20160104093829.GE5284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5687E169.4070704@users.sourceforge.net>
 <5687E203.1070404@users.sourceforge.net>
 <20160104092857.GD5284@mwanda>
In-Reply-To: <20160104092857.GD5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Btw, GCC misses a lot of uninitialized variable bugs.  I have a Smatch
check which sometimes catches the bugs that GCC misses but you should
not rely on the tools here.  These patches need to be reviewed manually.

And the "goto err" before the initialization makes everything more
complicated (that's actually what caused the bug in this patch, in fact).

regards,
dan carpenter

