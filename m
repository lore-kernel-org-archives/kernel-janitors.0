From: Miles Bader <snogglethorpe@gmail.com>
Date: Sat, 14 May 2005 23:37:52 +0000
Subject: [KJ] Re: [PATCH] typo patch on v850e_uart.c
Message-Id: <fc339e4a05051416374d2a2774@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc339e4a0505130050283b5291@mail.gmail.com>
In-Reply-To: <fc339e4a0505130050283b5291@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/13/05, Christophe Lucas <clucas@rotomalug.org> wrote:
> > Oh, I see it actually removes a blank line which contains a form-feed
> > character.  Same difference though:  it isn't a typo.
> 
> Oh sorry, it is not always easy for a french man to have the right word.

Er, I guess I'm not making my point well.  It's not the description
that's the problem, it's the patch.  I put the ^L there on purpose, I
don't want it to be removed unless there's a good reason, and your
mail didn't give a good reason.

If there _is_ a good reason (e.g., "Linus declares he hates ^L and
wants them all removed"), then please send it with the patch;
otherwise, please drop this patch.

Thanks,

-Miles
-- 
Do not taunt Happy Fun Ball.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
