From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Thu, 24 Feb 2005 10:13:22 +0000
Subject: Re: [KJ] [PATCH] drivers/i2c/chips/* : timer_after
Message-Id: <200502241310.31944.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71688812221053455=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050224095217.GB2721@rhum.iomeda.fr>
In-Reply-To: <20050224095217.GB2721@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============71688812221053455==
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thursday 24 February 2005 11:52, Christophe Lucas wrote:

> I think this patch have already posted, but kj TODO have been recently
> updated, and this entry already is here, so:
> 
> description:
> >From kj/TODO:
> 4.
> Some drivers do:
> if ((jiffies - data->last_updated > HZ * 2) ||
>             (jiffies < data->last_updated))
> Should be:
> #include <linux/jiffies.h>
> if (time_after(jiffies, data->last_updated + HZ * 2))

Greg KH already applied my patch with following diffstat:

 drivers/i2c/chips/adm1021.c    |    5 +++--
 drivers/i2c/chips/adm1025.c    |    5 ++---
 drivers/i2c/chips/adm1026.c    |    7 ++++---
 drivers/i2c/chips/adm1031.c    |    5 +++--
 drivers/i2c/chips/asb100.c     |    5 +++--
 drivers/i2c/chips/ds1621.c     |    5 +++--
 drivers/i2c/chips/eeprom.c     |    4 ++--
 drivers/i2c/chips/fscher.c     |    4 ++--
 drivers/i2c/chips/gl518sm.c    |    5 +++--
 drivers/i2c/chips/it87.c       |    5 +++--
 drivers/i2c/chips/lm63.c       |    5 ++---
 drivers/i2c/chips/lm75.c       |    5 +++--
 drivers/i2c/chips/lm77.c       |    5 +++--
 drivers/i2c/chips/lm78.c       |    5 +++--
 drivers/i2c/chips/lm80.c       |    5 ++---
 drivers/i2c/chips/lm83.c       |    5 ++---
 drivers/i2c/chips/lm85.c       |    5 +++--
 drivers/i2c/chips/lm87.c       |    5 ++---
 drivers/i2c/chips/lm90.c       |    5 ++---
 drivers/i2c/chips/max1619.c    |    6 ++----
 drivers/i2c/chips/pc87360.c    |    4 ++--
 drivers/i2c/chips/smsc47b397.c |    5 ++---
 drivers/i2c/chips/smsc47m1.c   |    4 ++--
 drivers/i2c/chips/via686a.c    |    6 +++---
 drivers/i2c/chips/w83627hf.c   |    5 +++--
 drivers/i2c/chips/w83781d.c    |    6 +++---
 drivers/i2c/chips/w83l785ts.c  |    5 ++---
 27 files changed, 69 insertions(+), 67 deletions(-)

	Alexey

--===============71688812221053455==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71688812221053455==--
