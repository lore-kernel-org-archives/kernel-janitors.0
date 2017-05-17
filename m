From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Date: Wed, 17 May 2017 21:15:37 +0000
Subject: Re: rcu: Call mod_timer() correctly in wake_nocb_leader_defer()
Message-Id: <20170517211537.GL3956@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170517194446.yz42z4wwrplbngxn@mwanda>
In-Reply-To: <20170517194446.yz42z4wwrplbngxn@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, May 17, 2017 at 11:37:16PM +0300, Dan Carpenter wrote:
> On Wed, May 17, 2017 at 01:21:48PM -0700, Paul E. McKenney wrote:
> > On Wed, May 17, 2017 at 10:44:46PM +0300, Dan Carpenter wrote:
> > > Smatch complains that:
> > > 
> > > 	kernel/rcu/tree_plugin.h:1838 wake_nocb_leader_defer()
> > > 	warn: mod_timer() takes an absolute time not an offset.
> > > 
> > > which is true.
> > > 
> > > Fixes: ebf7068a4396 ("rcu: Use timer as backstop for NOCB deferred wakeups")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Good catch, and color me slow and stupid!!!
> > 
> > I will fold this into the original commit with the following attribution:
> > 
> > [ paulmck: Dan Williams fix for mod_timer() bug detected by smatch. ]
> > 
> > Does that work for you?
> 
> Not really, no.  If you changed the Williams to Carpenter, then it's
> fine, though.  ;)

Gah!!!  I been Danned!!!  ;-)

Please accept my apologies, is the following better?

							Thanx, Paul

[ paulmck: Dan Carpenter fix for mod_timer() usage bug found by smatch. ]

