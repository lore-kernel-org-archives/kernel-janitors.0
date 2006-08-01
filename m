From: "Nish Aravamudan" <nish.aravamudan@gmail.com>
Date: Tue, 01 Aug 2006 22:06:31 +0000
Subject: [KJ] Fwd: use persistent allocation for cursor blinking.
Message-Id: <29495f1d0608011506p234a161cmf03238491f0a3f0d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Making sure janitors know about janitor work.

Thanks,
Nish

---------- Forwarded message ----------
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Aug 1, 2006 5:20 PM
Subject: Re: use persistent allocation for cursor blinking.
To: Roland Dreier <rdreier@cisco.com>
Cc: Dave Jones <davej@redhat.com>, Linux Kernel <linux-kernel@vger.kernel.org>


Ar Maw, 2006-08-01 am 12:15 -0700, ysgrifennodd Roland Dreier:
>  > Every time the console cursor blinks, we do a kmalloc/kfree pair.
>  > This patch turns that into a single allocation.
>
> A naiive question from someone who knows nothing about this subsystem:
> is there any possibility of concurrent calls into this function, for
> example if there are multiple cursors on a multiheaded system?

We don't do console multihead so its basically OK. Moving all the
console globals into a struct so we can have multiple instances would be
a good thing [tm] and it would make sense for the variable to end up in
said structure if it was done.

Definitely a janitor job there.

Alan

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
