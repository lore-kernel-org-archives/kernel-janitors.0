From: Paul Moore <paul@paul-moore.com>
Date: Fri, 25 Jan 2019 21:59:38 +0000
Subject: Re: [PATCH -next] selinux: Fix error return code in policydb_read()
Message-Id: <CAHC9VhQoZDBLrxawkk-K75hizBNKF6gLw1fcnZ7F5wbV6PJn7Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547821427-157169-1-git-send-email-weiyongjun1@huawei.com>
 <CAHC9VhSbtqhiMQdNJ_6yeX5+ggwVNyGYXe-E=bMj2V2z2MmAsA@mail.gmail.com>
 <20190119112148.375edf4c@canb.auug.org.au> <20190121070410.1c90552f@canb.auug.org.au>
 <CAHC9VhQTv=b_sLOdTQ9v1Z=0=Uf2JG74ZEw4yof-GsKuu9-s0Q@mail.gmail.com>
In-Reply-To: <CAHC9VhQTv=b_sLOdTQ9v1Z=0=Uf2JG74ZEw4yof-GsKuu9-s0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, peter enderborg <peter.enderborg@sony.com>, Kent Overstreet <kent.overstreet@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Ondrej Mosnacek <omosnace@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 22, 2019 at 12:39 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Sun, Jan 20, 2019 at 3:04 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > On Sat, 19 Jan 2019 11:21:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Fri, 18 Jan 2019 16:28:07 -0500 Paul Moore <paul@paul-moore.com> wrote:
> > > >
> > > > On Fri, Jan 18, 2019 at 9:18 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> > > > >
> > > > > Fix to return a negative error code -ENOMEM from the error handling
> > > > > case instead of 0, as done elsewhere in this function.
> > > > >
> > > > > Fixes: 31696241e96e ("selinux: convert to kvmalloc")
> > > >
> > > > Unfortunately this commit isn't to be found in any of the SELinux
> > > > branches, or Linus' master branch; based on the subject line I'm
> > > > guessing the original patch is in a -next branch somewhere.  Please
> > > > find whoever pushed this patch to linux-next and have them apply the
> > > > fix.
> > >
> > > Yeah, Kent has a series doing conversions that is in Andrew Morton's
> > > mmotm patch series.
> >
> > I have added that patch to the akpm-current tree in linux-next from today.
>
> Thanks Stephen.
>
> Wei Yongjun, have you talked with Kent and/or Andrew about getting
> your fix added to their tree?  It's good that Stephen picked it up,
> but it needs to get added to the original set of patches so the fix
> makes it's way into Linus' tree at the same time as the original
> patches.

Wei Yongjun, any progress on this?

-- 
paul moore
www.paul-moore.com
