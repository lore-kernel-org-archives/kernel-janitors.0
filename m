From: Adrian Bunk <bunk@stusta.de>
Date: Sat, 05 Mar 2005 01:15:38 +0000
Subject: Re: [KJ] [RFC][PATCH 2/5] char/tpqic02: use poll_event*() interface
Message-Id: <20050305011537.GP3327@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69582984099411083=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050303182541.GE11600@us.ibm.com>
In-Reply-To: <20050303182541.GE11600@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============69582984099411083==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2005 at 10:25:41AM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Description: Use new poll_event*() interface to encapsulate sleep-loops.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.11-kj-v/drivers/char/tpqic02.c	2005-03-01 23:38:09.000000000 -0800
> +++ 2.6.11-kj/drivers/char/tpqic02.c	2005-03-03 10:23:59.000000000 -0800
>...

Since at about half a year, this driver is no longer selectable via
Kconfig.

I should resend my patch that removes this driver...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============69582984099411083==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69582984099411083==--
