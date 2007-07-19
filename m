From: "pradeep singh" <pradeep.rautela@gmail.com>
Date: Thu, 19 Jul 2007 07:25:14 +0000
Subject: Re: netdev_priv()
Message-Id: <a901b49a0707190013r2d7c5305y813043cc479817ac@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/19/07, Thomas Surrel <thomas.surrel@gmail.com> wrote:
> Hi,
>
> I'm starting to work on the change to netdev_priv() call to access the
> priv field of the net_device structure. Is anybody already working on
> this ?

I am a little slow. Can you please help me in understanding why is a
change required in netdev_priv()?
Is something wrong in it?

thanks
--pradeep
>
> Also, what is the best way to organize my patches: one per subsystem
> (wireless, token ring, ...) or even more detailed which would imply a
> lot more patches ?
>
> Regards,
>
> Thomas
> -
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Pradeep
