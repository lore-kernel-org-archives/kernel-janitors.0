From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Mon, 02 May 2005 17:35:06 +0000
Subject: Re: [clucas@rotomalug.org: [KJ] set_current_state()]
Message-Id: <29495f1d0505021035c50625f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050502132850.GF9468@rhum.iomeda.fr>
In-Reply-To: <20050502132850.GF9468@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Christophe,

Sorry for not replying earlier, have been swamped at work.

> I have seen that in 2.6.12-rc3-kj, there is this patch :
> http://coderock.org/kj/2.6.12-rc3-kj/split/set_current_state-drivers_net_tokenring_tms380tr.patch
> 
> Can it be one janitor thing ?

Sure, the only trick is knowing when you do and do not need memory
barriers. Then you can choose between set_current_state() and
__set_current_state() respectively.

> I think yes, and have a patchset about this kind of work.
> 
> What do you think about this?

Seems reasonable -- expect some contention, though, these changes
don't achieve much (as in fixing broken code), unfortunately :)

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
