From: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Date: Wed, 24 Mar 2010 13:54:18 +0000
Subject: Re: [patch] llc: cleanup: remove dead code from llc_init()
Message-Id: <20100324135418.GD23594@ghostprotocols.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100324115510.GC21571@bicker>
In-Reply-To: <20100324115510.GC21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Octavian Purdila <opurdila@ixiacom.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Em Wed, Mar 24, 2010 at 02:55:10PM +0300, Dan Carpenter escreveu:
> We don't need "dev" any more after:
> 	a5a04819c5740cb1aa217af2cc8f5ef26f33d744
> 	[LLC]: station source mac address
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Old leftovers, well spotted, Dave, please apply.


Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>
