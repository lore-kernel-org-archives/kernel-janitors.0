From: Borislav Petkov <bp@alien8.de>
Date: Wed, 11 Mar 2015 19:48:02 +0000
Subject: Re: [PATCH 12/15] i82443bxgx_edac: don't export static symbol
Message-Id: <20150311194801.GC3359@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
 <1426092997-30605-13-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-13-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Tim Small <tim@buttersideup.com>, kernel-janitors@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 11, 2015 at 05:56:34PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r@
> type T;
> identifier f;
> @@
> 
> static T f (...) { ... }
> 
> @@
> identifier r.f;
> declarer name EXPORT_SYMBOL_GPL;
> @@
> 
> -EXPORT_SYMBOL_GPL(f);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.

Btw, from looking at this driver, it has been marked BROKEN since 2007
and we might just as well remove it. I'd be surprised if someone even
notices...

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
