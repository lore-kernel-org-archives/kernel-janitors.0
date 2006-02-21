From: "Jean Delvare" <khali@linux-fr.org>
Date: Tue, 21 Feb 2006 08:16:27 +0000
Subject: Re: [KJ][Patch] Alter prototypes in adm1026.c
Message-Id: <f62uR9ZR.1140509787.9416740.khali@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140182240.7789.44.camel@localhost.localdomain>
In-Reply-To: <1140182240.7789.44.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi Alexey,

On 2006-02-20, Alexey Dobriyan wrote:
> > ICC complains about : Storage Class is not First
> > @ line 301 & 302 of adm1026.c
> >
> > It appears that the variable in the prototype is named register which
> > confuses ICC, it is called (more sensibly) reg in the actual functions.
> > This is confusing (as register is a keyword)
>
> Applied. Standard more or less says, if pp-identifier can be converted to
> identifier or keyword, it's converted to keyword. So, we have
> "u8 [keyword]" oops...

Applied? To what, please? As the maintainer of the hwmon subsystem, I
took these patches already.

Thanks,
--
Jean Delvare

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
