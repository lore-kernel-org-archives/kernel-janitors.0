From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 06 Sep 2010 20:10:55 +0000
Subject: Re: [PATCH] md: do not use ++ in rcu_dereference() argument
Message-Id: <201009062210.56824.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711539-7123-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1283711539-7123-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kulikov Vasiliy <segooon@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, Neil Brown <neilb@suse.de>, Jens Axboe <jaxboe@fusionio.com>, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org

On Sunday 05 September 2010 20:32:18 Kulikov Vasiliy wrote:
> From: Vasiliy Kulikov <segooon@gmail.com>
> 
> rcu_dereference() is macro, so it might use its argument twice.
> Argument must not has side effects.
> 
> It was found by compiler warning:
> drivers/md/raid1.c: In function ‘read_balance’:
> drivers/md/raid1.c:445: warning: operation on ‘new_disk’ may be undefined

I think the rcu_dereference macro should really not evaluate its argument
twice, and I don't see where it does.
As a general rule, we try to write macros in Linux such that they behave
like functions and don't have surprising side-effects.

Which kernel and gcc version do you see the warning with?

	Arnd
