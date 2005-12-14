From: Dave Jones <davej@redhat.com>
Date: Wed, 14 Dec 2005 13:33:35 +0000
Subject: Re: [KJ] [Patch] check u32 < 0 in cpufreq-nforce2
Message-Id: <20051214133335.GD3829@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56691204811532669=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134563209.23516.2.camel@alice>
In-Reply-To: <1134563209.23516.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============56691204811532669==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 14, 2005 at 01:26:49PM +0100, Eric Sesterhenn / snakebyte wrote:
 > Hi,
 > 
 > arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c declares
 > pll as u32 which is unsigned, and checks it agains < 0.
 > This patch changes it from u32 to s32 so the check
 > makes sense, nforce2_write_pll() and nforce2_calc_pll()
 > also expect/return a signed int.
 > 
 > Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

Already fixed in cpufreq.git / -mm
Will go to Linus post 2.6.15

		Dave


--===============56691204811532669==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56691204811532669==--
