From: "Christopher Li" <sparse@chrisli.org>
Date: Wed, 05 Mar 2008 06:49:47 +0000
Subject: Re: [PATCH 6/9] drivers/net/wireless/iwlwifi/iwl-4965.c: Correct use of.and &
Message-Id: <70318cbf0803042249j57d7f3a3j7666961a9132b10b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk>
	 <20080305063842.GA24495@elte.hu>
In-Reply-To: <20080305063842.GA24495@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Julia Lawall <julia@diku.dk>, yi.zhu@intel.com, linux-wireless@vger.kernel.org, ipw3945-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Alexander Viro <viro@ftp.linux.org.uk>, linux-sparse@vger.kernel.org, Josh Triplett <josh@freedesktop.org>

I think Al Viro has sent a patch to linux-sparse with subject
"[PATCH 3/3] catch !x & y brainos" does exactly that.

Chris



On Tue, Mar 4, 2008 at 10:38 PM, Ingo Molnar <mingo@elte.hu> wrote:
>
>  * Julia Lawall <julia@diku.dk> wrote:
>
>  > From: Julia Lawall <julia@diku.dk>
>  >
>  > In commit e6bafba5b4765a5a252f1b8d31cbf6d2459da337, a bug was fixed
>  > that involved converting !x & y to !(x & y).  The code below shows the
>  > same pattern, and thus should perhaps be fixed in the same way.
>
>
> >       if (sta_ht_inf) {
>  >               if ((!sta_ht_inf->ht_supported) ||
>  > -                (!sta_ht_inf->cap & IEEE80211_HT_CAP_SUP_WIDTH))
>  > +                (!(sta_ht_inf->cap & IEEE80211_HT_CAP_SUP_WIDTH)))
>  >                       return 0;
>
>  i'm wondering, could Sparse be extended to check for such patterns?
>
>  People are regularly running "make C=1" and are sending fixes to make
>  entire subsystems sparse-warning-free, so Sparse is a nice mechanism
>  that works and it keeps code clean in the long run.
>
>  I dont think the "!X & Y" pattern is ever used legitimately [and even if
>  it were used legitimately, it's easy to avoid the sparse false positive
>  - while in the buggy case we have a clear bug].
>
>         Ingo
>  --
>  To unsubscribe from this list: send the line "unsubscribe linux-sparse" in
>
>
> the body of a message to majordomo@vger.kernel.org
>  More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
