From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 18 Dec 2004 04:15:43 +0000
Subject: Re: [KJ] [PATCH] lcd: replace cli()/sti() with
Message-Id: <20041218041543.GW7113@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83369265421094996=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041217235927.17998.75228.61750@localhost.localdomain>
In-Reply-To: <20041217235927.17998.75228.61750@localhost.localdomain>
To: James Nelson <james4765@verizon.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@osdl.org

--===============83369265421094996==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2004 at 05:59:05PM -0600, James Nelson wrote:
> Remove the cli()/sti() calls in drivers/char/lcd.c

I'm not sure why anyone would bother ...

config COBALT_LCD
        bool "Support for Cobalt LCD"
        depends on MIPS_COBALT

those machines are never SMP.

However, looking at the driver, it doesn't seem to generate interrupts,
so I don't see what good disabling interrupts would do.  I think we can
simply remove the save_flags/cli/restore_flags from this driver.  It needs
a fair chunk of work though -- should be converted to use writeb instead of

                                        *((volatile unsigned char *)
                                          burn_addr) =
                 (volatile unsigned char) rom[index];

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============83369265421094996==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83369265421094996==--
