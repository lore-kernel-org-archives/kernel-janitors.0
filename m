From: "Dan Carpenter" <error27@gmail.com>
Date: Mon, 18 Sep 2006 06:23:42 +0000
Subject: Re: [KJ] Real Time Behaviour
Message-Id: <a63d67fe0609172323r21a27201je37c09dfd59ffd49@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c49434130609172242n4335ad14jd68ad177bef0eeb@mail.gmail.com>
In-Reply-To: <c49434130609172242n4335ad14jd68ad177bef0eeb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 9/17/06, Tharindu Rukshan Bamunuarachchi <tharindunix@gmail.com> wrote:
> Dear All,
>
> I am going to achive some kind of rela time behaviour by increasing HZ
> value in kernel.
>
> I tried to change HZ value in include/asm/param.h.
>
> 1. HZ = 1000 --- Repsonse time <3ms
> 2. HZ = 1500 --- Response time <2ms
>
> I could not go beyond 1500, SHIFT_HZ parameter failed to adjust for 2000.
>
> How can i go beyond 1500 in HZ,
>
> Are there any other way to fine tune kernel to achive real time
> behaviour, other than changing HZ value??
>
> Thank you! in  advance!!

What was the URL which gave you this email address?  It's the wrong
one for your question.  You want to email kernelnewbies instead of
kernel-janitors.

   email:  kernelnewbies (at) nl (dot) linux (dot) org
website:  http://www.kernelnewbies.org

regards,
dan carpenter
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
