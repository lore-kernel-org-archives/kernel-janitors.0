From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Feb 2019 07:46:58 +0000
Subject: Re: [PATCH][V2][next] regulator: axp20x: check rdev is null before dereferencing it
Message-Id: <20190215074658.GF2326@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222113159.31029-1-colin.king@canonical.com>
 <CAGb2v6597uiPec=BPvTZgppxF2upTa_zKHq+QSbddyMGJAd7uA@mail.gmail.com>
In-Reply-To: <CAGb2v6597uiPec=BPvTZgppxF2upTa_zKHq+QSbddyMGJAd7uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chen-Yu Tsai <wens@csie.org>
Cc: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Feb 05, 2019 at 11:37:40AM +0800, Chen-Yu Tsai wrote:
> On Sat, Dec 22, 2018 at 7:32 PM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently rdev is dereferenced when assigning desc before rdev is null
> > checked, hence there is a potential null pointer dereference on rdev.
> > Fix this by null checking rdev first.
> >
> > Detected by CoverityScan, CID#1476031 ("Dereference before null check")
> >
> > Fixes: 77e3e3b165db ("regulator: axp20x: add software based soft_start for AXP209 LDO3")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> This patch somehow fell through the cracks. Sorry about that.
> 
> Both are really false positives.

I don't like when people use the word "false positive" like this.  The
code doesn't checks for NULL after a dereference so that's a nonsense
to do.  The correct thing is to remove the NULL check.

regards,
dan carpenter
