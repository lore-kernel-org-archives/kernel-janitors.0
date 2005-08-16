From: Oliver Korpilla <Oliver.Korpilla@gmx.de>
Date: Tue, 16 Aug 2005 12:53:43 +0000
Subject: [KJ] Timer code duplication in driver
Message-Id: <4301E1D7.5070707@gmx.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40488909034770693=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40488909034770693==
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

I was just reviewing code about high resolution timers for learning to 
use their API correctly, and have come to the following code duplication 
(in 2.6.12.4 kernel.org):

drivers/char/ipmi/ipmi_si_intf.c:

static inline void add_usec_to_timer(struct timer_list *t, long v)
{
    t->sub_expires += nsec_to_arch_cycle(v * 1000);
    while (t->sub_expires >= arch_cycles_per_jiffy)
    {
        t->expires++;
        t->sub_expires -= arch_cycles_per_jiffy;
    }
}

And the standard methods to do this are defined as:

include/linux/posix-timers.h:

static inline void
normalize_jiffies(unsigned long *jiff, long *sub_jif)
{
    while ((*(sub_jif) - arch_cycles_per_jiffy) >= 0) {
        *(sub_jif) -= arch_cycles_per_jiffy;
        (*(jiff))++;
    }
}
static inline void
full_normalize_jiffies(unsigned long *jiff, long *sub_jif)
{
    normalize_jiffies(jiff, sub_jif);
    while (*(sub_jif) < 0) {
        *(sub_jif) += arch_cycles_per_jiffy;
        (*(jiff))--;
    }
}

So wouldn't a better version be:

static inline void add_usec_to_timer(struct timer_list *t, long v)
{
    t->sub_expires += nsec_to_arch_cycle(v * 1000);
    full_normalize_jiffies(&(t->expires), &(t->sub_expires));
}

Anyone else thinking this should be fixed?

Could someone please review this?

Thanks and with kind regards,
Oliver Korpilla

--===============40488909034770693==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40488909034770693==--
