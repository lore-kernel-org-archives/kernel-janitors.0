From: Joe Perches <joe@perches.com>
Date: Fri, 01 May 2020 16:44:06 +0000
Subject: Re: [PATCH v3] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <4aeb5a976996efb08572f006bb82dc60f97ce73d.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200501154033.GA25730@udknight>
         <3aeb6ab5059ec753d922051d7732e13322188e7c.camel@perches.com>
         <20200501163440.GA19874@udknight>
In-Reply-To: <20200501163440.GA19874@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>, Markus.Elfring@web.de, kernel-janitors@vger.kernel.org

On Sat, 2020-05-02 at 00:34 +0800, Wang YanQing wrote:
> On Fri, May 01, 2020 at 08:57:42AM -0700, Joe Perches wrote:
> > On Fri, 2020-05-01 at 23:40 +0800, Wang YanQing wrote:
> > > According to submitting-patches.rst, 'Fixes:' tag has a little
> > > stricter condition about the one line summary than normal git
> > > commit description:
> > > “...
> > > Do not split the tag across multiple lines, tags are exempt from
> > > the "wrap at 75 columns" rule in order to simplify parsing scripts
> > > ...”
> > > 
> > > And there is no sanity check for 'Fixes:' tag format in checkpatch
> > > the same as GIT_COMMIT_ID for git commit description, so let's expand
> > > the GIT_COMMIT_ID to add 'Fixes:' tag format check support.
> > > 
> > > The check supports below formats:
> > > Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
> > > Fixes: 85f7cd3a2aad ("Revert "media: Kconfig: better support hybrid TV devices"")
> > > Fixes: 878520ac45f9 ("ext4: save the error code which triggered...")
> > > Fixes: 878520ac45f9 ("ext4: save the error code which triggered")
> > > Fixes: 277f27e2f277 ("SUNRPC/cache: Allow garbage collection ... ")
> > 
> > Hi again YanQing.
> > 
> > I think all the non-standard and incomplete forms
> > should have a warning emitted.
> 
> Hi Joe Perches

Hi, again. It's just Joe to my friends...

> I am not sure whether I get your words, you mean we need to emit warning
> for incomplete title line format? For example:
> Fixes: 277f27e2f277 ("SUNRPC/cache: Allow garbage collection ... ")

I think so yes.

It _might_ be useful to show "why" the message is being emitted.
(sha1 too short, no quotes around description, etc...)
