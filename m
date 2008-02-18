From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 18 Feb 2008 14:01:04 +0000
Subject: Re: [PATCH 6/7] sound: Use BUG_ON
Message-Id: <s5h4pc6uzxb.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802171856530.28055@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802171856530.28055@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: perex@suse.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Sun, 17 Feb 2008 18:57:30 +0100 (CET),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
> side-effects to allow a definition of BUG_ON that drops the code completely.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @ disable unlikely @ expression E,f; @@
> 
> (
>   if (<... f(...) ...>) { BUG(); }
> |
> - if (unlikely(E)) { BUG(); }
> + BUG_ON(E);
> )
> 
> @@ expression E,f; @@
> 
> (
>   if (<... f(...) ...>) { BUG(); }
> |
> - if (E) { BUG(); }
> + BUG_ON(E);
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
> 
> diff -u -p a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
> --- a/sound/core/seq/oss/seq_oss_synth.c 2006-11-30 19:05:47.000000000 +0100
> +++ b/sound/core/seq/oss/seq_oss_synth.c 2008-02-17 16:43:24.000000000 +0100
> @@ -245,8 +245,7 @@ snd_seq_oss_synth_setup(struct seq_oss_d
>  		info->nr_voices = rec->nr_voices;
>  		if (info->nr_voices > 0) {
>  			info->ch = kcalloc(info->nr_voices, sizeof(struct seq_oss_chinfo), GFP_KERNEL);
> -			if (!info->ch)
> -				BUG();
> +			BUG_ON(!info->ch);

Actually this shouldn't be BUG() but do error-processing properly...
Will fix this later.


thanks,

Takashi
