From: Dave Kleikamp <shaggy@austin.ibm.com>
Date: Thu, 23 Feb 2006 22:58:25 +0000
Subject: [KJ] Re: [Patch] kzalloc conversion in fs/jfs
Message-Id: <1140735505.10002.37.camel@kleikamp.austin.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47146917850882231=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <OF57A8F0B2.D5D6B63C-ON8725711C.007A85A0-8625711C.007C195A@us.ibm.com>
In-Reply-To: <OF57A8F0B2.D5D6B63C-ON8725711C.007A85A0-8625711C.007C195A@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============47146917850882231==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2006-02-23 at 01:05 +0100, Eric Sesterhenn wrote:
> hi,
> 
> this converts fs/jfs to kzalloc() usage.
> compile tested with make allyesconfi
>
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

Thanks.  I've merged it and will push it to the -mm tree.

Shaggy
-- 
David Kleikamp
IBM Linux Technology Center


--===============47146917850882231==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47146917850882231==--
