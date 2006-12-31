From: David Miller <davem@davemloft.net>
Date: Sun, 31 Dec 2006 20:37:15 +0000
Subject: Re: [KJ] [PATCH] net/core/flow.c: compare data with memcmp
Message-Id: <20061231.123715.115911390.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612310837y786fd764oc18bf37c8f0b2b8c@mail.gmail.com>
In-Reply-To: <80ec54e90612310837y786fd764oc18bf37c8f0b2b8c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: daniel.marjamaki@gmail.com
Cc: netdev@vger.kernel.org, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

From: "Daniel_Marjam=E4ki" <daniel.marjamaki@gmail.com>
Date: Sun, 31 Dec 2006 17:37:05 +0100

> From: Daniel Marjam=E4ki
> This has been tested by me.
> Signed-off-by: Daniel Marjam=E4ki <daniel.marjamaki@gmail.com>

Please do not do this.

memcmp() cannot assume the alignment of the source and
destination buffers and thus will run more slowly than
that open-coded comparison.

That code was done like that on purpose because it is
one of the most critical paths in the networking flow
cache lookup which runs for every IPSEC packet going
throught the system.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
