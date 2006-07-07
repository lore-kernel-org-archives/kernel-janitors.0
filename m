From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Fri, 07 Jul 2006 18:03:39 +0000
Subject: Re: [KJ] [Patch] acpi: remove unnecassary check of
Message-Id: <20060707110339.6078c0bc.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0607071044u64f2cf23pa22846e77f0fc3af@mail.gmail.com>
In-Reply-To: <8ef77f2e0607071044u64f2cf23pa22846e77f0fc3af@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 7 Jul 2006 19:44:50 +0200 tom hisch wrote:

> thank you for all your tips!
> 
> 2nd try:
> this patch is against 2.6.18-rc1
> 
> it removes an unnecassary check of acpi_ac_dir_param.
> 
> it compiles clean on x86 with the applied patch but I do not have a smart
> battery to test it.
> 
> tabs don't work in the gmail compose mail window so i have attached the
> patch. any ideas how to send patches with gmail ??

I've never seen info on how to do that other than by using
attachments.

> now everything ok ?

We'll see if the KJ maintainer comments on it.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
