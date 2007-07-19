From: "Thomas Surrel" <thomas.surrel@gmail.com>
Date: Thu, 19 Jul 2007 09:01:16 +0000
Subject: Re: netdev_priv()
Message-Id: <d858bca40707190201k7e2f6e0wee7abc4d20215054@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/19/07, pradeep singh <pradeep.rautela@gmail.com> wrote:
> On 7/19/07, Thomas Surrel <thomas.surrel@gmail.com> wrote:
> > Hi,
> >
> > I'm starting to work on the change to netdev_priv() call to access the
> > priv field of the net_device structure. Is anybody already working on
> > this ?
>
> I am a little slow. Can you please help me in understanding why is a
> change required in netdev_priv()?
> Is something wrong in it?

No, nothing is wrong with it. But lots of drivers don't use it to
access the 'priv' field of the net_device structure (they do dev->priv
instead). So the change required is in the net drivers, not in the
netdev_priv() call. Sorry if I was unclear.

Regards,

Thomas
