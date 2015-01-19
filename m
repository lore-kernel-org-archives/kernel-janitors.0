From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Jan 2015 18:20:47 +0000
Subject: Re: [PATCH] MTD: Deletion of checks before the function call "iounmap"
Message-Id: <20150119182047.GG6456@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54BBE87C.9020705@users.sourceforge.net>
 <20150119175835.GH9759@ld-irv-0074>
In-Reply-To: <20150119175835.GH9759@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, SF Markus Elfring <elfring@users.sourceforge.net>

The sparc iounmap() implementation in arch/sparc/kernel/ioport.c looks
it prints an error message if you pass a NULL pointer.

regards,
dan carpenter

