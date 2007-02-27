From: "Standard Azi" <stdazi@gmail.com>
Date: Tue, 27 Feb 2007 09:03:25 +0000
Subject: Re: [KJ] [PATCH] 3c505.c: replacing strcpy to strncpy
Message-Id: <1be7d7fe0702270103u64dfc53bl4dca76d45f2c1a0b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070225173528.GB3595@localhost.localdomain>
In-Reply-To: <20070225173528.GB3595@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

char buf[150];

strcpy(buf, "LALA");

that's one reason, for example

On 2/27/07, burns.ethan@gmail.com <burns.ethan@gmail.com> wrote:
> On Mon, Feb 26, 2007 at 10:10:36PM -0300, Douglas Schilling Landgraf wrote:
> > Use strncpy instead of strcpy.
>
> Is there ever a reason to use strcpy() over strncpy()?  If not, there's
> probably another todo item here:
>
> ~/src/linux-2.6 $ grep -r strcpy . | wc -l
> 2592
>
>
>                 --Ethan
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
