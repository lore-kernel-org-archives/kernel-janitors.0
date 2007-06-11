From: Andi Drebes <lists-receive@programmierforen.de>
Date: Mon, 11 Jun 2007 18:53:31 +0000
Subject: Re: [KJ] Re: [PATCH] drivers/isdn/hisax: ARRAY_SIZE instead of sizeof
Message-Id: <200706112053.31933.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706101235.09578.lists-receive@programmierforen.de> <82faac5b0706110525s56bade43rb24619b54687770d@mail.gmail.com> <20070611174706.GA9150@pingi.kke.suse.de>
In-Reply-To: <20070611174706.GA9150@pingi.kke.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Jenkins <darrenrjenkins@gmail.com>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, kernel-janitors@lists.osdl.org, linux-kernel <linux-kernel@vger.kernel.org>

<snip>
> Agree, here is a new version.
> 
> This patch replaces various array size calculations in drivers/isdn/hisax
> done using sizeof with the ARRAY_SIZE macro.
Thanks for the work Karsten.

	Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
