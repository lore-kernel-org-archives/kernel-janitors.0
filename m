From: Wang YanQing <udknight@gmail.com>
Date: Fri, 01 May 2020 16:34:40 +0000
Subject: Re: [PATCH v3] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <20200501163440.GA19874@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200501154033.GA25730@udknight>
 <3aeb6ab5059ec753d922051d7732e13322188e7c.camel@perches.com>
In-Reply-To: <3aeb6ab5059ec753d922051d7732e13322188e7c.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>, Markus.Elfring@web.de, kernel-janitors@vger.kernel.org

On Fri, May 01, 2020 at 08:57:42AM -0700, Joe Perches wrote:
> On Fri, 2020-05-01 at 23:40 +0800, Wang YanQing wrote:
> > According to submitting-patches.rst, 'Fixes:' tag has a little
> > stricter condition about the one line summary than normal git
> > commit description:
> > “...
> > Do not split the tag across multiple lines, tags are exempt from
> > the "wrap at 75 columns" rule in order to simplify parsing scripts
> > ...”
> > 
> > And there is no sanity check for 'Fixes:' tag format in checkpatch
> > the same as GIT_COMMIT_ID for git commit description, so let's expand
> > the GIT_COMMIT_ID to add 'Fixes:' tag format check support.
> > 
> > The check supports below formats:
> > Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
> > Fixes: 85f7cd3a2aad ("Revert "media: Kconfig: better support hybrid TV devices"")
> > Fixes: 878520ac45f9 ("ext4: save the error code which triggered...")
> > Fixes: 878520ac45f9 ("ext4: save the error code which triggered")
> > Fixes: 277f27e2f277 ("SUNRPC/cache: Allow garbage collection ... ")
> 
> Hi again YanQing.
> 
> I think all the non-standard and incomplete forms
> should have a warning emitted.

Hi Joe Perches
I am not sure whether I get your words, you mean we need to emit warning
for incomplete title line format? For example:
Fixes: 277f27e2f277 ("SUNRPC/cache: Allow garbage collection ... ")


Thanks.
> 
> > The check doesn't support below formats:
> > Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface"
> > Fixes: 6c73698904aa pinctrl: qcom: Introduce readl/writel accessors
> > Fixes: 3fd6e7d9a146 (ASoC: tas571x: New driver for TI TAS571x power amplifiers)
> > Fixes: 55697cbb44e4 ("arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices nodes)
> > Fixes: ba35f8588f47 (“ipvlan: Defer multicast / broadcast processing to a work-queue”)
> > Fixes: cd758a9b57ee "KVM: PPC: Book3S HV: Use __gfn_to_pfn_memslot in HPT page fault handler"
> > Fixes:      9b1640686470 ("scsi: lpfc: Fix use-after-free mailbox cmd completion")
> > Fixes: 03f6fc6de919 ('ASoC: rt5682: Add the soundwire support')
> 
> 
> > Note: this patch also fixes double quotation mark issue for normal git
> >       commit description, and now it supports double quotation mark in
> >       title line, for example:
> >       Commit e33e2241e272 ("Revert "cfg80211: Use 5MHz bandwidth by default
> >       when checking usable channels"")
> 
> Nice.
> 
