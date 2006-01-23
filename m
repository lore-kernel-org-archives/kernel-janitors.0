From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Mon, 23 Jan 2006 00:19:14 +0000
Subject: Re: [KJ] request_region cleanup question
Message-Id: <9a8748490601221619u22f0663cgb03f8b52fefecdb4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060122191407.woomvhufmoxwowoo@webmail.rongage.org>
In-Reply-To: <20060122191407.woomvhufmoxwowoo@webmail.rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/23/06, Ron Gage <ron@rongage.org> wrote:
> Hello...
>
> Is it acceptable/preferred to evaluate the actual return code from
> request_region, or is it acceptable to just follow an error path should the
> call to request_region fail?
>
> In other words, which is preferred:
> ret=request_region(blah,blah...);
> if (ret) { fault path }
>       - or -
> if (request_region(blah,blah...)) { fault path }
>
> I see it go both ways in the current kernel (2.6.15) and want to know if there
> is a preferred way to go here.
>

I believe the prefered form is generally

foo = bar();
if (foo) {
   /* stuff */
}

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
