From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Sat, 02 Feb 2013 19:30:37 +0000
Subject: Question about printking
Message-Id: <CALF0-+V-8m1TwnM0MUbNCncnECF_r_FVcyu_Duu0tqcsPoFR5A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+XX27u4rmpe8RHiy5DsbHvoYP9DWQts+rTRfEvPQG4s8Q@mail.gmail.com>
In-Reply-To: <CALF0-+XX27u4rmpe8RHiy5DsbHvoYP9DWQts+rTRfEvPQG4s8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

Hello,

I have a quick question.
I (think I) remember Greg KH reviewing some driver patch on staging
mailing list,
suggesting not to do this sort of printking upon an allocation request failure:

ptr = kmalloc(sizeof(foo));
if (!ptr) {
        pr_err("Cannot allocate memory for foo\n");
        return -ENOMEM;
}

His argue against it was that kmalloc already takes care of reporting/printking
a good deal of interesting information when this happens.

Is my memory right?

Can someone expand a bit on this whole idea? (of abuse of printing,
or futility of printing).

I'm asking after seeing *a lot* of drivers doing exactly this.

Thanks,

--
    Ezequiel
