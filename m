From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 05 Sep 2010 19:23:35 +0000
Subject: Re: [PATCH] md: do not use ++ in rcu_dereference() argument
Message-Id: <20100905192335.GA8140@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711539-7123-1-git-send-email-segooon@gmail.com>
 <20100905190139.GA3163@merkur.ravnborg.org>
In-Reply-To: <20100905190139.GA3163@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kernel-janitors@vger.kernel.org, Neil Brown <neilb@suse.de>, Jens Axboe <jaxboe@fusionio.com>, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 05, 2010 at 21:01 +0200, Sam Ravnborg wrote:
> On Sun, Sep 05, 2010 at 10:32:18PM +0400, Kulikov Vasiliy wrote:
> > From: Vasiliy Kulikov <segooon@gmail.com>
> > 
> > rcu_dereference() is macro, so it might use its argument twice.
> > Argument must not has side effects.
> > 
> > It was found by compiler warning:
> > drivers/md/raid1.c: In function ‘read_balance’:
> > drivers/md/raid1.c:445: warning: operation on ‘new_disk’ may be undefined
> 
> This change looks wrong.
> In the original implementation new_disk is incremented and
> then we do the array lookup.
> With your implementation it looks like we increment it after
> the array lookup.

No, the original code increments new_disk and then dereferences mirrors.

The full code:

		for (rdev = rcu_dereference(conf->mirrors[new_disk].rdev);
		     r1_bio->bios[new_disk] = IO_BLOCKED ||
		     !rdev || !test_bit(In_sync, &rdev->flags)
			     || test_bit(WriteMostly, &rdev->flags);
		     rdev = rcu_dereference(conf->mirrors[++new_disk].rdev)) {

			if (rdev && test_bit(In_sync, &rdev->flags) &&
				r1_bio->bios[new_disk] != IO_BLOCKED)
				wonly_disk = new_disk;

			if (new_disk = conf->raid_disks - 1) {
				new_disk = wonly_disk;
				break;
			}
		}

    so,

    for (a; b; c = f(++g)) {
       ...
    } 

    =

    a;
    while (b) {
       ...
       l_continue:
       c = f(++g);
    }

    =

    a;
    while (b) {
       ...
       l_continue:
       g++;
       c = f(g);
    }

    =

    for (a; b; c = f(g)) {
       ...
       g++;
    } 

Or you mean smth more?

-- 
Vasiliy
