From: Adrian Bunk <bunk@fs.tum.de>
Date: Wed, 22 Sep 2004 11:21:58 +0000
Subject: [Kernel-janitors] 2.6.9-rc2-kjt1 rio_linux compile error
Message-Id: <20040922112157.GB27364@fs.tum.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============052431161272227023=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040921221307.GG4260@stro.at>
In-Reply-To: <20040921221307.GG4260@stro.at>
To: kj <kernel-janitors@osdl.org>, linux-kernel@vger.kernel.org, Nishanth Aravamudan <nacc@us.ibm.com>

--===============052431161272227023==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 22, 2004 at 12:13:07AM +0200, maximilian attems wrote:
>...
> added since 2.6.9-rc1-kjt1
>...
> msleep-drivers_char_rio_linux.patch
>   From: Nishanth Aravamudan <nacc@us.ibm.com>
>   Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 20/33] char/rio_linux: replace 	schedule_timeout() with msleep()/msleep_interruptible()
>...

This doesn't compile (obvious typo):

<--  snip  -->

...
  CC      drivers/char/rio/rio_linux.o
drivers/char/rio/rio_linux.c: In function `RIODelay':
drivers/char/rio/rio_linux.c:333: warning: implicit declaration of function `jiffes_to_msecs'
...
  LD      .tmp_vmlinux1
drivers/built-in.o(.text+0x141239): In function `RIODelay':
: undefined reference to `jiffes_to_msecs'
make: *** [.tmp_vmlinux1] Error 1

<--  snip  -->

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============052431161272227023==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============052431161272227023==--
