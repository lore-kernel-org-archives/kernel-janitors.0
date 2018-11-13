From: Dominique Martinet <asmadeus@codewreck.org>
Date: Tue, 13 Nov 2018 05:53:24 +0000
Subject: Re: [V9fs-developer] [PATCH] net/9p: include trans_common.h to fix missing prototype warning.
Message-Id: <20181113055324.GB5116@nautica>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Adeodato Simó wrote on Tue, Nov 13, 2018:
> This silences -Wmissing-prototypes when defining p9_release_pages.
> 
> Signed-off-by: Adeodato Simó <dato@net.com.org.es>
> ---
>  net/9p/trans_common.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> It was suggested in the kernel-janitors mailing list that silencing
> -Wmissing-prototypes would make for a worthy cause.
> 
> https://www.spinics.net/lists/linux-kernel-janitors/msg43981.html
> 
> Thanks for considering!

Looks harmless enough, and it does belong in that .h as non-static, so
will take it.
If you'll let me be a little bit annoying, could you please resend it
after adding linux-kernel@vger.kernel.org in Cc? (please set the
in-reply-to to your first mail or this one if possible as well)

The point is that neither v9fs-developer or kernel-janitors are archived
in lkml.kernel.org / marc.info so I cannot add a Link: tag to this
e-mail easily; I need some major list Cc'd for these.
Might as well be consistent if we can :)

Thanks!
-- 
Dominique
