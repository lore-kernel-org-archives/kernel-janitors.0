From: Eric Miao <eric.y.miao@gmail.com>
Date: Wed, 16 Sep 2009 14:46:57 +0000
Subject: Re: [PATCH] arch/arm: adjust duplicate structure field initialization
Message-Id: <f17812d70909160746k46b61baay1ace7ef06c1fa6b7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909161105580.8590@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0909161105580.8590@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 16, 2009 at 5:06 PM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Currently the irq_type field of the csb726_lan_config structure is
> initialized twice. =C2=A0The value in the first case,
> SMSC911X_IRQ_POLARITY_ACTIVE_LOW, is normally stored in the irq_polarity
> field, so I have renamed the field in the first initialization to that.
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>

Applied to 'fix'.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
