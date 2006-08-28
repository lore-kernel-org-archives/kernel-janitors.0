From: Bernd Petrovitsch <bernd@firmix.at>
Date: Mon, 28 Aug 2006 20:08:13 +0000
Subject: Re: [KJ] string concatenation with __FUNCTION__
Message-Id: <1156795693.3105.6.camel@gimli.at.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d16b1c80608281227k6aad7416u10a626d6a0b9cf18@mail.gmail.com>
In-Reply-To: <d16b1c80608281227k6aad7416u10a626d6a0b9cf18@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2006-08-29 at 00:57 +0530, Shakthi Kannan wrote:
[...]
> TODO entry:
> - remove string concatenation with __FUNCTION__ (get rid of
>   warnings, and get ready for __func__):
>   - printk(KERN_INFO "blabla " __FUNCTION__ "\n");
>   + printk(KERN_INFO "blabla %s\n", __FUNCTION__);
> 
> What does it mean by "get ready for __func__ "?

__func__ is a C variable (and not a constant string) so the string
concatenation doesn't work.

> I have checked with 2.6.18-rc4 and all references of __FUNCTION__
> don't have any "string concatenation".

Yes, because they have been fixed and IIRC it is already #define to
__func__ since several months.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
