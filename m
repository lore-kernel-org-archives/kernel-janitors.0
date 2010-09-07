From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 07 Sep 2010 19:21:55 +0000
Subject: Re: [PATCH] md: do not use ++ in rcu_dereference() argument
Message-Id: <20100907192154.GA14214@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711539-7123-1-git-send-email-segooon@gmail.com>
 <201009062210.56824.arnd@arndb.de>
In-Reply-To: <201009062210.56824.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, Neil Brown <neilb@suse.de>, Jens Axboe <jaxboe@fusionio.com>, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Sep 06, 2010 at 22:10 +0200, Arnd Bergmann wrote:
> On Sunday 05 September 2010 20:32:18 Kulikov Vasiliy wrote:
> > From: Vasiliy Kulikov <segooon@gmail.com>
> > 
> > rcu_dereference() is macro, so it might use its argument twice.
> > Argument must not has side effects.
> > 
> > It was found by compiler warning:
> > drivers/md/raid1.c: In function ‘read_balance’:
> > drivers/md/raid1.c:445: warning: operation on ‘new_disk’ may be undefined
> 
> I think the rcu_dereference macro should really not evaluate its argument
> twice, and I don't see where it does.
> As a general rule, we try to write macros in Linux such that they behave
> like functions and don't have surprising side-effects.
> 
> Which kernel and gcc version do you see the warning with?
> 
> 	Arnd

gcc version 4.4.3 (Ubuntu 4.4.3-4ubuntu5), linux-next.

#define __rcu_dereference_check(p, c, space) \
	({ \
		typeof(*p) *_________p1 = (typeof(*p)*__force )ACCESS_ONCE(p); \
                                                                   ^
		rcu_lockdep_assert(c); \
		(void) (((typeof (*p) space *)p) = p); \
                                      ^     ^
		smp_read_barrier_depends(); \
		((typeof(*p) __force __kernel *)(_________p1)); \
	})

If I understand this, it is evaluated three times, right?


-- 
Vasiliy
