From: "David S. Miller" <davem@davemloft.net>
Date: Mon, 06 Mar 2006 20:57:19 +0000
Subject: [KJ] Re: [Patch] kzalloc() conversion in arch/sparc64
Message-Id: <20060306.125719.41409526.davem@davemloft.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68864140889409908=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060227193309.GA9991@suse.de>
In-Reply-To: <20060227193309.GA9991@suse.de>
To: kernel-janitors@vger.kernel.org

--===============68864140889409908==
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 06 Mar 2006 21:13:30 +0100

> this patch converts arch/sparc64 to kzalloc usage.
> Crosscompile tested with allyesconfig.
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

Thanks, I'll queue this up for 2.6.17

--===============68864140889409908==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68864140889409908==--
