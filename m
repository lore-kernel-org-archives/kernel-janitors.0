From: maximilian attems <maks@sternwelten.at>
Date: Sun, 27 Aug 2006 19:40:04 +0000
Subject: Re: [KJ] Item to remove from TODO list
Message-Id: <20060827194004.GH4868@baikonur.stro.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44F1EEA2.3090602@gmail.com>
In-Reply-To: <44F1EEA2.3090602@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Aug 27, 2006 at 03:12:34PM -0400, Jim Nelson wrote:
> 
> Just finished checking the MOD_INC/DEC_USE_COUNT item in the TODO list - there
> are no more code paths that use it, and only a couple of commented-out
> references, comments and changelogs.
> 
> It probably should be removed from the TODO list.
> 
> Jim

one shouldn't remove too early,
as some items tend to show up in newly merged code ;)

-- 
maks
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
