From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Thu, 08 Feb 2007 11:40:22 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <20070208114022.GA9526@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 08, 2007 at 02:59:41PM +0530, Mehul Jani wrote:
> On 2/8/07, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> >
> >On Thu, Feb 08, 2007 at 01:51:45AM +0200, Ahmed S. Darwish wrote:
> >> It seems that no one is assigned the Min and Max macro job. I'll take
> >> it if no one seems interested.
> >>
> >> Well, I hope this to become my last brain-dead patch series :).
> >
> >Be very very careful to not add integer overflows.
> >
>
> I had started the activity. changed the handcrafted MAX macro to *max* from
> the kernel.h in the xdr4.c file ( no quite sure of the complete file name)
> 
> the max macro is applied in struct , i changed it and recompile failed.

Hi Mehul,

(Please use reply-to-all, and let the quoted text be on the top not on the 
bottom)

Will you continue the task for the whole tree ?.

-- 
Ahmed S. Darwish
http://darwish-07.blogspot.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
