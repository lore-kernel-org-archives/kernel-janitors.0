From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Tue, 09 Jan 2007 13:57:37 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <82faac5b0701090557h42de0583oea219e3ca798a6af@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day guys

Cleaning this up does seem like a good janitorial task to me.
It should make the code more clear and consistant, it might also
identify a bug or two in this area. :)

On 1/9/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:
> What about something like:
>
> #define LESS_THEN_2_BITS(x)  (x & (x - 1))
> #define IS_POWER_OF_2(x)   (x != 0 && LESS_THEN_2_BITS(x))

As for names, I would go for something like

#define IS_POWER_OF_2(x) ((x & (x - 1)) = 0)

With either

#define IS_POWER_OF_2_NZ(x) (x != 0 && IS_POWER_OF_2(x))
or
#define IS_SINGLE_BIT_SET(x) (x != 0 && IS_POWER_OF_2(x))

> Robert P. J. Day wrote:
> as a first pass, i would try a cleanup that left the semantics of the
> existing code *exactly* the way it was.  so if there was a
> pathological case in the current code, it would still be there in the
> new code.  that's clearly the safe way to proceed.

Yes, and that way the maintainers should see your initial patches and evaluate
which case is required on their own. ;)

Darren J
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
