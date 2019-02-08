From: Andrea Parri <andrea.parri@amarulasolutions.com>
Date: Fri, 08 Feb 2019 00:28:29 +0000
Subject: Re: About swapoff race patch  (was Re: [PATCH] mm, swap: bounds check swap_info accesses to avoid NU
Message-Id: <20190207234244.GA6429@andrea>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114222529.43zay6r242ipw5jb@ca-dmjordan1.us.oracle.com>
 <20190115002305.15402-1-daniel.m.jordan@oracle.com>
 <20190129222622.440a6c3af63c57f0aa5c09ca@linux-foundation.org>
 <87tvhpy22q.fsf_-_@yhuang-dev.intel.com>
 <20190131124655.96af1eb7e2f7bb0905527872@linux-foundation.org>
 <alpine.LSU.2.11.1902041257390.4682@eggly.anvils>
In-Reply-To: <alpine.LSU.2.11.1902041257390.4682@eggly.anvils>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Huang, Ying" <ying.huang@intel.com>, Daniel Jordan <daniel.m.jordan@oracle.com>, dan.carpenter@oracle.com, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, osandov@fb.com, tj@kernel.org, ak@linux.intel.com, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, paulmck@linux.ibm.com, stern@rowland.harvard.edu, peterz@infradead.org, willy@infradead.org, will.deacon@arm.com

Hi Huang, Ying,

On Mon, Feb 04, 2019 at 01:37:00PM -0800, Hugh Dickins wrote:
> On Thu, 31 Jan 2019, Andrew Morton wrote:
> > On Thu, 31 Jan 2019 10:48:29 +0800 "Huang\, Ying" <ying.huang@intel.com> wrote:
> > > Andrew Morton <akpm@linux-foundation.org> writes:
> > > > mm-swap-fix-race-between-swapoff-and-some-swap-operations.patch is very
> > > > stuck so can you please redo this against mainline?
> > > 
> > > Allow me to be off topic, this patch has been in mm tree for quite some
> > > time, what can I do to help this be merged upstream?

[...]


> 
> Wow, yes, it's about a year old.
> 
> > 
> > I have no evidence that it has been reviewed, for a start.  I've asked
> > Hugh to look at it.
> 
> I tried at the weekend.  Usual story: I don't like it at all, the
> ever-increasing complexity there, but certainly understand the need
> for that fix, and have not managed to think up anything better -
> and now I need to switch away, sorry.

FWIW, I do agree with Hugh about "the need for that fix": AFAIU, that
(mainline) code is naively buggy _and_ "this patch":

  http://lkml.kernel.org/r/20180223060010.954-1-ying.huang@intel.com

"redone on top of mainline" seems both correct and appropriate to me.


> (I was originally horrified by the stop_machine() added in swapon and
> swapoff, but perhaps I'm remembering a distant past of really stopping
> the machine: stop_machine() today looked reasonable, something to avoid
> generally like lru_add_drain_all(), but not as shameful as I thought.)

AFAIC_find_on_LKML, we have three different fixes (at least!): resp.,

  1. refcount(-based),
  2. RCU,
  3. stop_machine();

(3) appears to be the less documented/relied-upon/tested among these;
I'm not aware of definitive reasons forcing us to reject (1) and (2).

  Andrea


> 
> Hugh
