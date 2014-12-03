From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Dec 2014 13:20:02 +0000
Subject: Re: [patch] CodingStyle: add some more error handling guidelines
Message-Id: <20141203132002.GT5048@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141202085950.GA13434@mwanda>
 <547F0297.6030202@users.sourceforge.net>
 <20141203124511.GR5048@mwanda>
 <547F0977.7090908@users.sourceforge.net>
In-Reply-To: <547F0977.7090908@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Coccinelle <cocci@systeme.lip6.fr>, backports@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "Luis R. Rodriguez" <mcgrof@suse.com>

Sorry.  I misread your email.  If the code looks like this:

	foo = kmalloc();
	if (!foo)
		goto kmalloc_failed;

The "kmalloc_failed" doesn't add any information.  We can see that
kmalloc failed from the context.

regards,
dan carpenter

