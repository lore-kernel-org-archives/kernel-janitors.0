From: Dan Carpenter <error27@gmail.com>
Date: Wed, 02 Jan 2013 05:10:36 +0000
Subject: Re: [PATCH RESEND 6/6] clk: s5p-g2d: Fix incorrect usage of IS_ERR_OR_NULL
Message-Id: <CA+_b7DK2zbBzbCh15ikEAeGP5h-V9gQ_YcX15O-RNvWxCk8Zfg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
 <1355852048-23188-7-git-send-email-linux@prisktech.co.nz>
 <50D62BC9.9010706@mvista.com> <50E32C06.5020104@gmail.com>
In-Reply-To: <50E32C06.5020104@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

clk_get() returns NULL if CONFIG_HAVE_CLK is disabled.

I told Tony about this but everyone has been gone with end of year
holidays so it hasn't been addressed.

Tony, please fix it so people don't apply these patches until
clk_get() is updated to not return NULL.  It sucks to have to revert
patches.

regards,
dan carpenter
