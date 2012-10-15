From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Oct 2012 13:27:50 +0000
Subject: Re: mm/memcontrol.c:423:6: error: redefinition of 'sock_update_memcg'
Message-Id: <201210151327.50394.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015022334.GE7203@localhost>
In-Reply-To: <20121015022334.GE7203@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 15 October 2012, Fengguang Wu wrote:
> commit: 652eaf71a39f10c2cb78f924ca5d0b070454dbe4  mm/memcontrol: provide sock_update_memcg without INET
> config: x86_64-randconfig-h062 (attached as .config)
> 
> This also occurs in branch HEAD: arm-soc/testing/defconfig-warnings
> 

Ok, it seems the same bug was fixed upstream in a different way,
dropping my patch.

Thanks!

	Arnd
