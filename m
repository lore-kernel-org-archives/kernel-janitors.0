From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 16 Dec 2013 13:43:38 +0000
Subject: Re: [patch] isdn: use strlcpy() instead strcpy()
Message-Id: <1387201418.19078.225.camel@edumazet-glaptop2.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131216094626.GC13831@elgon.mountain>
In-Reply-To: <20131216094626.GC13831@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2013-12-16 at 12:46 +0300, Dan Carpenter wrote:
> I don't think the in-kernel drivers ever hit this strcpy() so this
> doesn't change how the code works.  But strcpy() is safer.
> 

strcpy() is safer ?

-ENOPARSE ...


