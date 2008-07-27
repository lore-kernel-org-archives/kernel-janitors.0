From: Michael Borisov <niro@tut.by>
Date: Sun, 27 Jul 2008 09:56:55 +0000
Subject: Re: [PATCH 1/14 v2] drivers/isdn/hisax/telespci.c: fix warning
Message-Id: <1217152615.7323.4.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1217145098.6042.2.camel@inlin>
In-Reply-To: <1217145098.6042.2.camel@inlin>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> > Probably now it is correct ? 
> 
> Please explain why.


Because added pci_dev_put() and not used assignment in if condition.
Right ?

