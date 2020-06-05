From: Peter Xu <peterx@redhat.com>
Date: Fri, 05 Jun 2020 12:48:16 +0000
Subject: Re: [PATCH] KVM: selftests: delete some dead code
Message-Id: <20200605124816.GB55548@xz-x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200605110048.GB978434@mwanda>
 <9f20e25d-599d-c203-e3d4-905b122ef5a3@redhat.com>
 <20200605115316.z5tavmf5rjobypve@kamzik.brq.redhat.com>
In-Reply-To: <20200605115316.z5tavmf5rjobypve@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Jones <drjones@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>, Ben Gardon <bgardon@google.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 05, 2020 at 01:53:16PM +0200, Andrew Jones wrote:
> On Fri, Jun 05, 2020 at 01:16:59PM +0200, Paolo Bonzini wrote:
> > On 05/06/20 13:00, Dan Carpenter wrote:
> > > The "uffd_delay" variable is unsigned so it's always going to be >= 0.
> > > 
> > > Fixes: 0119cb365c93 ("KVM: selftests: Add configurable demand paging delay")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  tools/testing/selftests/kvm/demand_paging_test.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
> > > index 360cd3ea4cd67..4eb79621434e6 100644
> > > --- a/tools/testing/selftests/kvm/demand_paging_test.c
> > > +++ b/tools/testing/selftests/kvm/demand_paging_test.c
> > > @@ -615,8 +615,6 @@ int main(int argc, char *argv[])
> > >  			break;
> > >  		case 'd':
> > >  			uffd_delay = strtoul(optarg, NULL, 0);
> > > -			TEST_ASSERT(uffd_delay >= 0,
> > > -				    "A negative UFFD delay is not supported.");
> > >  			break;
> > >  		case 'b':
> > >  			vcpu_memory_bytes = parse_size(optarg);
> > > 
> > 
> > The bug is that strtoul is "impossible" to use correctly.

Could I ask why?

> > The right fix
> > would be to have a replacement for strtoul.
> 
> The test needs an upper limit. It obviously doesn't make sense to ever
> want a ULONG_MAX usec delay. What's the maximum number of usecs we should
> allow?

Maybe this test can also be used to emulate a hang-forever kvm mmu fault due to
some reason we wanted, by specifying an extremely large value here?  From that
POV, seems still ok to even keep it unbound as a test...

Thanks,

-- 
Peter Xu
