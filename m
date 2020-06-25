From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jun 2020 09:04:49 +0000
Subject: Re: [PATCH] intel_idle: Fix uninitialized variable bug
Message-Id: <20200625090449.GA2549@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200624131921.GB9972@mwanda>
 <CAJZ5v0hG2FL0VSeE+ind9MSMc_c7nA4KjKxFPdMhVOPrMdYJKQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0hG2FL0VSeE+ind9MSMc_c7nA4KjKxFPdMhVOPrMdYJKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Len Brown <lenb@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Kees Cook <keescook@chromium.org>

On Wed, Jun 24, 2020 at 03:41:05PM +0200, Rafael J. Wysocki wrote:
> On Wed, Jun 24, 2020 at 3:19 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The "tick" variable isn't initialized if "lapic_timer_always_reliable"
> > is true.
> 
> If lapic_timer_always_reliable is true, then
> static_cpu_has(X86_FEATURE_ARAT) must also be true AFAICS.
> 
> So the lapic_timer_always_reliable check in there looks redundant.

Can the lapic_timer_always_reliable variable just be removed entirely
and replaced with an static_cpu_has(X86_FEATURE_ARAT) check?

regards,
dan carpenter
