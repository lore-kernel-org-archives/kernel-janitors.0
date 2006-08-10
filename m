From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Thu, 10 Aug 2006 01:11:06 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <82faac5b0608091811v1217ac44i3e48006e4d1eed44@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
	 <82faac5b0608071753q71050d72uadcf55bc1e54f30e@mail.gmail.com>
	 <6de39a910608071953l39ce0873w713d59eda4aa5d84@mail.gmail.com>
	 <200608092025.02259.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
In-Reply-To: <200608092025.02259.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Cc: "Om N." <xhandle@gmail.com>, kernel-janitors@osdl.org, linux-kernel@vger.kernel.org

G'day,

On 8/10/06, Andrew James Wade <andrew.j.wade@gmail.com> wrote:
> You're getting duplicated code there. That'll be an issue in more
> complex loops. How about:
>
> unsigned long timeout = jiffies + HZ/2;
> int timeup = 0;
>
> for (;;;) {
>         if (ready())
>                 return 0;
>         if (timeup)
>                 break;
>         msleep(10);
>         timeup = time_after(timeout, jiffies);
> };
> ... timeout ...
>

Nice, looks better than my idea.
Removes the code duplication and reduces complexity(a little) at the
cost of an extra variable.

The only Nitpick is

- int timeup = 0;
+ unsigned char timeup = 0;


>
> Andrew Wade

Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
