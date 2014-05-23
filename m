From: Raghavendra KT <raghavendra.kt@linux.vnet.ibm.com>
Date: Fri, 23 May 2014 13:52:02 +0000
Subject: Re: [patch] sched: signedness bug in yield_to()
Message-Id: <CAC4Lta3+GHLEMYNHsvx4vsN557vFdrBO_ROo8mN4JpG3T3ejJg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140523102042.GA7267@mwanda>
In-Reply-To: <20140523102042.GA7267@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, May 23, 2014 at 3:50 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> yield_to() is supposed to return -ESRCH if there is no task to
> yield to, but because the type is bool that is the same as returning
> true.
>
> The only place I see which cares is kvm_vcpu_on_spin().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks,  Please feel free to add
Reviewed-by: Raghavendra <raghavendra.kt@linux.vnet.ibm.com>
