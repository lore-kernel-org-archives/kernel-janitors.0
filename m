From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 Dec 2014 12:51:13 +0000
Subject: Re: [patch] CodingStyle: add some more error handling guidelines
Message-Id: <547F0741.1090808@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141202085950.GA13434@mwanda> <547F0297.6030202@users.sourceforge.net> <547F0465.407@broadcom.com>
In-Reply-To: <547F0465.407@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <arend@broadcom.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Coccinelle <cocci@systeme.lip6.fr>, backports@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "Luis R. Rodriguez" <mcgrof@suse.com>

>> * To which source code place should the word "location" refer to?
>>    - jump source
>>    - jump target
> 
> I think you digested the paragraph in too small bits.

I would prefer to reduce the probability for misunderstandings of the 
proposed wording a bit more.


> The term "goto location" looks synonymous to "jump source" to me.

I would interpret it differently because of the specific placement of this key word
before an other term.

Regards,
Markus
