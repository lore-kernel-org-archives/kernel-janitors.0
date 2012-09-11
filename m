From: Frederic Weisbecker <fweisbec@gmail.com>
Date: Tue, 11 Sep 2012 11:23:56 +0000
Subject: Re: [rcu:rcu:idle 2/27] include/linux/rcupdate.h:969:2: error: #endif without #if
Message-Id: <20120911112343.GF21277@somewhere.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120907000952.GA7952@localhost>
In-Reply-To: <20120907000952.GA7952@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 07, 2012 at 08:09:52AM +0800, Fengguang Wu wrote:
> Hi Frederic,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/idle
> head:   dea42dc2282b9c8f78eb1fb6c4a0c81d700dd31c
> commit: f105e7d73a465c74f00d554c855a3ddfdb7fa4ae [2/27] rcu: New rcu_user_enter_irq() and rcu_user_exit_irq() APIs
> config: i386-randconfig-m011 (attached as .config)

Thanks for your reports, I'm fixing this.
