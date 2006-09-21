From: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Date: Thu, 21 Sep 2006 13:36:39 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/atm [sane version]
Message-Id: <d120d5000609210636n49a35953w44aefe7068f286fd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609210012j6c82379cs53fc374b675a5883@mail.gmail.com>
In-Reply-To: <6b4e42d10609210012j6c82379cs53fc374b675a5883@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Om Narasimhan <om.turyx@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, linux-atm-general@lists.sourceforge.net

Hi,

On 9/21/06, Om Narasimhan <om.turyx@gmail.com> wrote:
> -       dev->atm_vccs = kmalloc (dev->nchannels * sizeof (struct atm_vcc *),
> +       dev->atm_vccs = kcalloc (sizeof (struct atm_vcc *), dev->nchannels,
>                                 GFP_KERNEL);

kcalloc's first argument is number of elements to allocate, size is
the second argument.

>
> -       scq = (struct scq_info *) kmalloc(sizeof(struct scq_info), GFP_KERNEL);
> +       scq = (struct scq_info *) kzalloc(sizeof(struct scq_info), GFP_KERNEL);

Kill this cast please.

-- 
Dmitry
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
