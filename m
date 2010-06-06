From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 06 Jun 2010 16:40:40 +0000
Subject: Re: [PATCH] drivers/staging/pohmelfs: fix compile warning
Message-Id: <AANLkTikYhy8NSs9uPBf9QFebeCrCPvuOlaf85fb2Dl1T@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275788460.10961.18.camel@lenovo>
In-Reply-To: <1275788460.10961.18.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

>
> No warning with gcc 4.4.3.
> What gcc version are you using?

gcc (Ubuntu 4.4.3-4ubuntu5) 4.4.3

> Perhaps you should upgrade.
>

Strange, I have a warning with last linux-next:

drivers/staging/pohmelfs/inode.c: In function ‘pohmelfs_put_super’:
drivers/staging/pohmelfs/inode.c:1269: warning: ‘count’ may be used
uninitialized in this function

Best regards,

-----------------------------------------
Javier Martínez Canillas
+595 981 88 66 58
