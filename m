From: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 04 Apr 2019 11:28:05 +0000
Subject: Re: [PATCH 1/2] cpumask: Introduce possible_cpu_safe()
Message-Id: <20190404112805.GZ4038@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404100218.GA26946@kadam>
 <20190404103528.GG12864@dhcp22.suse.cz>
In-Reply-To: <20190404103528.GG12864@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, Amritha Nambiar <amritha.nambiar@intel.com>, Willem de Bruijn <willemb@google.com>, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 04, 2019 at 12:35:28PM +0200, Michal Hocko wrote:
> On Thu 04-04-19 13:02:19, Dan Carpenter wrote:
> > There have been two cases recently where we pass user a controlled "cpu"
> > to possible_cpus().  That's not allowed.  If it's invalid, it will
> > trigger a WARN_ONCE() and an out of bounds read which could result in an
> > Oops.
> > 
> > This patch introduces possible_cpu_safe() which first checks to see if
> > the cpu is valid, turns off speculation and then checks if the cpu is
> > possible.
> 
> Why cannot we do the check in possible_cpu directly? Is it used from any
> hot path? I am quite skeptical people will use the new helper
> consistently.

Why only possible? What is to say stop anyone from using garbage (aka.
user input) in any other of the cpumask APIs.

I'd much rather have the explicit validate call and keep assuming @cpu
as used in the rest of the API is sane.
