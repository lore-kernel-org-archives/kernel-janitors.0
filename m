From: "=?ISO-8859-1?Q?Daniel_Marjam=E4ki?=" <daniel.marjamaki@gmail.com>
Date: Mon, 01 Jan 2007 07:47:48 +0000
Subject: Re: [KJ] [PATCH] net/core/flow.c: compare data with memcmp
Message-Id: <80ec54e90612312347w2b906e5eg725a7761110c6897@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612310837y786fd764oc18bf37c8f0b2b8c@mail.gmail.com>
	 <20061231.123715.115911390.davem@davemloft.net>
In-Reply-To: <20061231.123715.115911390.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

Hello!

So you mean that in this particular case it's faster with a handcoded
comparison than memcmp? Because both key1 and key2 are located at
word-aligned addresses?
That's fascinating.

Best regards,
Daniel

2006/12/31, David Miller <davem@davemloft.net>:
> From: "Daniel_Marjam=E4ki" <daniel.marjamaki@gmail.com>
> Date: Sun, 31 Dec 2006 17:37:05 +0100
>
> > From: Daniel Marjam=E4ki
> > This has been tested by me.
> > Signed-off-by: Daniel Marjam=E4ki <daniel.marjamaki@gmail.com>
>
> Please do not do this.
>
> memcmp() cannot assume the alignment of the source and
> destination buffers and thus will run more slowly than
> that open-coded comparison.
>
> That code was done like that on purpose because it is
> one of the most critical paths in the networking flow
> cache lookup which runs for every IPSEC packet going
> throught the system.
>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
