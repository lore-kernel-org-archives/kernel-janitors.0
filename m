From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 17 Nov 2014 14:30:57 +0000
Subject: Re: s390/net: Deletion of unnecessary checks before two function calls
Message-Id: <546A06A1.3060203@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54687F1A.1010809@users.sourceforge.net> <20141116111023.GA4905@mwanda> <20141116111446.GA4956@mwanda> <54688F15.9070703@users.sourceforge.net> <20141117073408.GC4905@mwanda> <5469B836.8030507@users.sourceforge.net> <20141117134515.GE4905@mwanda>
In-Reply-To: <20141117134515.GE4905@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>, Eric Paris <eparis@redhat.com>, Frank Blaschka <blaschka@linux.vnet.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Ursula Braun <ursula.braun@de.ibm.com>, linux390@de.ibm.com, linux-s390@vger.kernel.org

> What do you want me to clarify?  Do you still not see the bug?

Would you like to point out that you notice the warning message
"fsm: kfree_fsm called with NULL argument" after my update suggestion?

How do you think about to share a bit more information about the
corresponding function call graph from your test system?

Regards,
Markus

