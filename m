From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 18 Dec 2004 03:02:33 +0000
Subject: Re: [KJ] [PATCH] generic_serial: replace cli()/sti() with
Message-Id: <20041218030233.GV7113@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42802006365700279=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041218002600.19176.34205.85406@localhost.localdomain>
In-Reply-To: <20041218002600.19176.34205.85406@localhost.localdomain>
To: James Nelson <james4765@verizon.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@osdl.org

--===============42802006365700279==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2004 at 06:25:39PM -0600, James Nelson wrote:
>  
> +static spinlock_t driver_lock = SPIN_LOCK_UNLOCKED;
> +

It can't be static.  The drivers are going to have to use it in their
interrupt routines to synchronise with the generic_serial code.

It'd be much better to convert the drivers that use generic_serial
to use serial_core instead.  I'd recommend not touching this unless you
have the hardware concerned.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============42802006365700279==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42802006365700279==--
