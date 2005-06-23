From: randy_dunlap <rdunlap@xenotime.net>
Date: Thu, 23 Jun 2005 20:43:55 +0000
Subject: Re: [KJ] [PATCH] bonding - uninitialize static variables
Message-Id: <20050623134355.29b20d0b.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70048976542197661=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050623192901.GE4398@voyager>
In-Reply-To: <20050623192901.GE4398@voyager>
To: kernel-janitors@vger.kernel.org

--===============70048976542197661==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jun 2005 21:29:02 +0200 Carlo Perassi wrote:

| This patch uninitializes five static int initialized to 0.
| 
| Signed-off-by: Carlo Perassi <carlo@linux.it>
| ---
|  drivers/net/bonding/bond_main.c |   10 +++++-----
|  1 files changed, 5 insertions(+), 5 deletions(-)
| 
| Index: linux-2.6.12/drivers/net/bonding/bond_main.c
| ===================================================================
| --- linux-2.6.12.orig/drivers/net/bonding/bond_main.c
| +++ linux-2.6.12/drivers/net/bonding/bond_main.c
| @@ -531,8 +531,8 @@
|  
|  static int max_bonds	= BOND_DEFAULT_MAX_BONDS;
|  static int miimon	= BOND_LINK_MON_INTERV;
| -static int updelay	= 0;
| -static int downdelay	= 0;
| +static int updelay;
| +static int downdelay;
|  static int use_carrier	= 1;
|  static char *mode	= NULL;
|  static char *primary	= NULL;

Those NULLs can also be discarded.

---
~Randy

--===============70048976542197661==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70048976542197661==--
