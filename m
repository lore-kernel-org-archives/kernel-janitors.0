From: Paolo Teti <paolo.teti@gmail.com>
Date: Mon, 28 Nov 2005 10:34:55 +0000
Subject: Re: [KJ][PATCH] linux-2.6.15-rc2 apm_emu.c audit misc_register() ret.
Message-Id: <34a7ae040511280234r40dfbd53q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <34a7ae040511230009j20cff459r@mail.gmail.com>
In-Reply-To: <34a7ae040511230009j20cff459r@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Speaking of your patch, it shouldn't use KERN_WARNING and should (minor
> nitpick) test for "< 0", not "!= 0".
>
>

Why?
Looking at misc_register function the rule is

"A zero is returned on success and a negative errno code for failure."

So test for !=0 is also correct!!

Sorry probably because I have used Ccr instead of Cc I have also sent this patch
to Benjamin Herrenschmidt ( the ppc APM manteiner) and now this patch
is on the -mm
tree as show below!

Sorry!!

----
The patch titled

    apm_emu.c: fix a missing check on misc_register() return code

has been added to the -mm tree.  Its filename is

    apm_emuc-fix-a-missing-check-on-misc_register-return-code.patch


From: Paolo Teti <paolo.teti@gmail.com>

fix a missing check on misc_register() return code

Signed-off-by: Paolo Teti <tetipaol@libero.it>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Andrew Morton <akpm@osdl.org>


Acked by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
