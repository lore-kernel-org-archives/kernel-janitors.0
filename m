From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 22 Oct 2012 08:18:20 +0000
Subject: Re: a dedicated list for build error reports?
Message-Id: <20121022081820.GA6851@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121018130146.GA11433@localhost>
In-Reply-To: <20121018130146.GA11433@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 22, 2012 at 09:30:19AM +0200, Julia Lawall wrote:
> On Mon, 22 Oct 2012, Dan Carpenter wrote:
> 
> > On Thu, Oct 18, 2012 at 03:07:55PM -0400, David Miller wrote:
> > > From: Fengguang Wu <fengguang.wu@intel.com>
> > > Date: Thu, 18 Oct 2012 21:01:46 +0800
> > >
> > > > On Thu, Oct 18, 2012 at 03:45:22PM +0300, Dan Carpenter wrote:
> > > >> On Wed, Oct 17, 2012 at 11:10:42AM +0200, Luis G.F wrote:
> > > >> > unsubscribe kernel-janitors
> > > >>
> > > >> Uh.  Obviously this isn't the right way to unsubscribe.  You have to
> > > >> send the email to majordomo@vger.kernel.org and not to the list.
> > > >>
> > > >> But I do think we should maybe find another list for Fengguang's
> > > >> emails?  It's sort of a lot higher traffic than before and sort of a
> > > >> different flavour.
> > > >
> > > > Agreed.. I'm afraid that my report titles are much more messy than
> > > > the normal emails and there could be a dozen of such reports per day.
> > > >
> > > > It may be more clean to send the build error/warning reports to a
> > > > standalone list.
> > > >
> > > >> I still will want to subscribe to the emails, but it would be better
> > > >> to use a different list.  Apparently Dave Miller didn't like the
> > > >> idea of creating a special list for it because he didn't like the
> > > >> emails in the first place.  But now I think everyone likes them a
> > > >> lot.  It might be worth asking again.
> > > >
> > > > CC Dave Miller for possible new inputs.
> > >
> > > I find them super annoying, and these reports are extremely sub-optimal
> > > as is.
> > >
> > > The amount of time spent composing these reports could equally be spent
> > > condensing the error down to a small, self contained, set of text
> > > explaining the exact build failure and an initial root-cause estimate.
> > > And sending it to the correct maintainer's list.
> > >
> > > Heck, in the same amount of time, you could even implement the damn
> > > fix!

> > My understanding is the emails are composed automatically and take
> > zero time.  If the error message has a very low false positive rate,
> > then the email is sent without any human interaction at all.

Yeah, that's the main idea. I'm trying to automating the email
reporting so as to achieve fast response time by avoiding human
introduced delays.

Build errors have been mostly automated, except when the system is not
so confident about the correctness of bisection.

Most gcc warnings cannot be false by nature and they are auto reported
too. The "possibly uninitialized variable" warnings have high false
rate, however considering that gcc warnings feels not good even if they
are false ones, I'm sending out private emails to the commit author to
make sure he is at least aware of the (possibly false) warning.

Some of the sparse/smatch/coccinelle warnings can be auto reported,
too.  I'm now maintaining a list that are assumed to have low false
ratio (please correct me, thanks!):

        ______ smatch warnings ______
        redundant null check
        doing dma on the stack
        ______ cocci warnings ______
        casting value returned by
        alloc with no test
        kzalloc should be used for
        casting value returned by k[cmz]alloc to
        returns NULL not ERR_PTR on failure
        PTR_RET can be used
        PTR_ERR applied after initialization to constant
        ERR_CAST can be used with
        inconsistent IS_ERR and PTR_ERR, PTR_ERR
        of_node_put not needed after iterator
        devm_request_mem_region followed by ioremap
        Missing resource_size with
        Suspicious code. resource_size is maybe missing with
        nested lock+irqsave that reuses flags from line
        application of sizeof to pointer
        test of a variable/field address
        opportunity for kmemdep
        opportunity for kstrdep
        opportunity for simple_open
        comparing pointer to 0
        Comparison to bool
        Comparison of bool
        Assignment of bool
        ______ sparse warnings ______
        sparse: incorrect type in
        sparse: cast from restricted
        sparse: cast to restricted
         degrades to integer
        sparse: Using plain integer as NULL pointer
        sparse: expression using sizeof bool
        sparse: invalid assignment:
        sparse: cast truncates bits from constant value
        sparse: dubious: x | !y
        sparse: cast removes address space of expression
        sparse: mixing different enum types
        sparse: non-ANSI function declaration of function
         was not declared. Should it be static?
         with external linkage has definition

However there are other lots of static check warnings that do need
manual check, which are now reported via private emails to Yuanhan and
me. If any one is interested in analyzing these possibly false
warnings and making bug fixing patches out of them, you'll be warmly
welcomed! :-)

> Perhaps what would be useful for the kernel janitors list is one message
> per day with one-line summaries of the affected files and the detected
> problems?  The goal of sending it to kernel janitors was just to avoid
> duplicated work, and it seems like such summaries would do that just as
> well, without inducing so many messages?

Good idea. I can do the summary if the too many reports are a problem
for the list.

However it also means you'll not see many of the responses from the
developers. Since the majority trees are not tied to a mailing list,
many reports will become private emails if not CC kernel-janitors.

Thanks,
Fengguang
