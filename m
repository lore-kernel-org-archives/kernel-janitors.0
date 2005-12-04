From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Sun, 04 Dec 2005 05:09:45 +0000
Subject: Re: [KJ] [PATCH 20/21] polling loops: change exit condition to
Message-Id: <9a8748490512032109lb725710rc4c68998225dc4c9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43923735.4060604@gmail.com>
In-Reply-To: <43923735.4060604@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/4/05, Roland Dreier <roland@digitalvampire.org> wrote:
>  > Why add a new variable in this second part of the patch? end_time is
>  > only used once,so you could just do
>  >   while (time_before(jiffies, jiffies + msecs_to_jiffies(100))) {
>
> Umm, think about it... how could that loop ever exit?
>
Ouch, you are right. I was not thinking straight.


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
