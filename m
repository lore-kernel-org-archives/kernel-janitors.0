From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 07 Feb 2018 15:38:45 +0000
Subject: Re: [PATCH] coccinelle: deref_null: avoid useless computation
Message-Id: <CAK7LNARNBYVK+Fjyx_31KFCx67Y2XxuCxTw9aSPrkWB+9h4fNg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1517643898-2801-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1517643898-2801-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

2018-02-03 16:44 GMT+09:00 Julia Lawall <Julia.Lawall@lip6.fr>:
> The effect of the rules ifm1, pr11, and pr12 is only used in the final rule,
> which depends on context && !org && !report.  Thus these rules should only
> be performed in those circumstances.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---

Applied to linux-kbuild/kbuild.  Thanks!


-- 
Best Regards
Masahiro Yamada
