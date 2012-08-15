From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 15 Aug 2012 05:35:31 +0000
Subject: Re: [userns:for-next 10/23] ERROR: "free_pid_ns" [net/ipv6/ipv6.ko] undefined!
Message-Id: <20120815053531.GA27307@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <877gt0hgak.fsf@xmission.com>
In-Reply-To: <877gt0hgak.fsf@xmission.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Aug 14, 2012 at 10:31:47PM -0700, Eric W. Biederman wrote:
> Fengguang Wu <fengguang.wu@intel.com> writes:
> 
> > Hi Eric,
> >
> > FYI, kernel build failed on
> >
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git for-next
> > head:   0625c883bc4b3eba6f93f268cf67b5664244c0fe
> > commit: 4f82f45730c68fdaf9b0472495a965188404866e [10/23] net ip6 flowlabel: Make owner a union of struct pid * and kuid_t
> > config: x86_64-allmodconfig (attached as .config)
> >
> > Build errors:
> >
> > ERROR: "free_pid_ns" [net/ipv6/ipv6.ko] undefined!
> 
> Yes, and the next patch fixes that.
> 
> My apologies to git bisect users that the support for modular ipv6 is
> not perfect.

Fine for me - I normally build-in everything ;)

Thanks,
Fengguang
