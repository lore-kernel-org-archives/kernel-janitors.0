From: Tomas Melin <tomas.melin@iki.fi>
Date: Fri, 04 May 2012 16:25:00 +0000
Subject: Re: [PATCH] Staging: Comedi adv_pci1710 : Corrected DPRINTK formatting
Message-Id: <CACraW2qX9qUPHKQxGDgcAD_3YvMAB=Sk4aWKKvtN51nutPiL=Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, May 4, 2012 at 4:34 PM, Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
> On Thu, May 03, 2012 at 06:27:36PM +0300, Tomas Melin wrote:
>> Corrected formatting for several DPRINT messages.
>>
>
> This patch is fine, but eventually these will have to changed to:
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_dbg(dev->class_dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"adv_pci1710 EDBG: BGN: pc=
i171x_ai_cmdtest(...) err=3D%d ret=3D1\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err);
>

Ok, I see. So dev_dbg() should always be preffered for debug printing?

Also while we are at it, how strict is the rule that printk:s should
include KERN_ facility level statements? are missing facility levels
worth patching?

regards,
Tomas



> Or even better they can just be removed after the driver is stable.
> It's not worth shifting things around too much if we're just going
> to redo it later.
>
> regards,
> dan carpenter
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
