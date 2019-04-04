From: Michal Hocko <mhocko@kernel.org>
Date: Thu, 04 Apr 2019 10:35:28 +0000
Subject: Re: [PATCH 1/2] cpumask: Introduce possible_cpu_safe()
Message-Id: <20190404103528.GG12864@dhcp22.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404100218.GA26946@kadam>
In-Reply-To: <20190404100218.GA26946@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, Amritha Nambiar <amritha.nambiar@intel.com>, Willem de Bruijn <willemb@google.com>, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

On Thu 04-04-19 13:02:19, Dan Carpenter wrote:
> There have been two cases recently where we pass user a controlled "cpu"
> to possible_cpus().  That's not allowed.  If it's invalid, it will
> trigger a WARN_ONCE() and an out of bounds read which could result in an
> Oops.
> 
> This patch introduces possible_cpu_safe() which first checks to see if
> the cpu is valid, turns off speculation and then checks if the cpu is
> possible.

Why cannot we do the check in possible_cpu directly? Is it used from any
hot path? I am quite skeptical people will use the new helper
consistently.
-- 
Michal Hocko
SUSE Labs
