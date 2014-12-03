From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 Dec 2014 23:11:31 +0000
Subject: Re: [patch] CodingStyle: add some more error handling guidelines
Message-Id: <547F98A3.7090509@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141202085950.GA13434@mwanda> <547F0297.6030202@users.sourceforge.net> <20141203124511.GR5048@mwanda> <547F0977.7090908@users.sourceforge.net> <20141203132002.GT5048@mwanda> <547F0F2A.3060708@users.sourceforge.net> <547F1942.5060502@broadcom.com> <547F33AC.50002@users.sourceforge.net> <547F60E5.50705@broadcom.com>
In-Reply-To: <547F60E5.50705@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <arend@broadcom.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Coccinelle <cocci@systeme.lip6.fr>, backports@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "Luis R. Rodriguez" <mcgrof@suse.com>

> Please provide your point of view.

I would like to interpret the key word "goto" from the C programming
language a bit more here so that a better common understanding can
eventually be achieved.

Strong opinions might be floating around for the consistent naming
of jump labels. My reasoning works like the following.

This key word could also be interpreted as two items "go" and "to",
couldn't it?
How much does this variation stress its meaning in a specific direction?

Some software developers would like to express the reason about
an unexpected event at the jump source. But I guess that this approach
increases the risk for a popular story like "goto fail;", doesn't it?
I would prefer not to specify "go to failure".

So I find that there are more variants possible to stress the jump target.
Examples:
* Failure_exit
* out_memory_release
* unregister_item

Regards,
Markus
