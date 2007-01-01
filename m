From: David Miller <davem@davemloft.net>
Date: Mon, 01 Jan 2007 08:49:05 +0000
Subject: Re: [KJ] [PATCH] net/core/flow.c: compare data with memcmp
Message-Id: <20070101.004905.98552337.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612310837y786fd764oc18bf37c8f0b2b8c@mail.gmail.com>
	<20061231.123715.115911390.davem@davemloft.net>
	<80ec54e90612312347w2b906e5eg725a7761110c6897@mail.gmail.com>
In-Reply-To: <80ec54e90612312347w2b906e5eg725a7761110c6897@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: daniel.marjamaki@gmail.com
Cc: netdev@vger.kernel.org, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

From: "Daniel_Marjam=E4ki" <daniel.marjamaki@gmail.com>
Date: Mon, 1 Jan 2007 08:47:48 +0100

> So you mean that in this particular case it's faster with a handcoded
> comparison than memcmp? Because both key1 and key2 are located at
> word-aligned addresses?
> That's fascinating.

Essentially, yes.

However, I wonder.  GCC should be able to see this also, and
if it expands the memset() inline the code emitted should be
very similar.

It is something to investigate on a few cpu types, for sure.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
