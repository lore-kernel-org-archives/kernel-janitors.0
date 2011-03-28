From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 28 Mar 2011 15:46:23 +0000
Subject: Re: [PATCH 2/2 v2] tg3: Don't use IRQF_SAMPLE_RANDOM
Message-Id: <AANLkTi=Qkf2qn6nQ-6AXE8LtFSD++=eZRxa6ND6KPsk1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301314543-3666-1-git-send-email-martinez.javier@gmail.com> <1301315152.3182.19.camel@edumazet-laptop>
In-Reply-To: <1301315152.3182.19.camel@edumazet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: David Miller <davem@davemloft.net>, Dan Carpenter <error27@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 28, 2011 at 2:25 PM, Eric Dumazet <eric.dumazet@gmail.com> wrote:
>
> 1) We dont believe its Janitor material ;)
>
> http://thread.gmane.org/gmane.linux.kernel/680723
>
> http://kerneltrap.org/mailarchive/linux-netdev/2009/4/6/5417754
>

I wasn't aware of this discussion. In one hand network drivers are not
a good source of entropy because they can be controlled externally,
but in embedded systems with only network cards (no video, audio,
keyboard, etc) the only source of entropy they have is their network
cards (at the kernel level i.e: not using EGD to feed /dev/random).

Yes this definitely is not janitor material :)

I just sent the patch because I saw IRQF_SAMPLE_RANDOM in
Documentation/feature-removal-schedule.txt. I can resend a patch
removing the macro in the remaining network cards if the decision is
to remove IRQF_SAMPLE_RANDOM.

Best regards,

-----------------------------------------
Javier Martínez Canillas
(+34) 682 39 81 69
PhD Student in High Performance Computing
Computer Architecture and Operating System Department (CAOS)
Universitat Autònoma de Barcelona
Barcelona, Spain
