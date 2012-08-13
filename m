From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 13 Aug 2012 17:55:16 +0000
Subject: Re: [userns:userns-always-map-user-v45 80/99] fs/namespace.c:2290:1: error: unknown type name 'atomi
Message-Id: <20120813175516.GA32757@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120812145023.GA17077@localhost>
 <87k3x3z3de.fsf@xmission.com>
 <20120813133910.GA30532@localhost>
 <63f9e712-3cd1-4020-9df6-8fb8d9c3f1ec@email.android.com>
In-Reply-To: <63f9e712-3cd1-4020-9df6-8fb8d9c3f1ec@email.android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, kernel-janitors@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

> >I'd suggest to fix it in m68k and make atomic64_t generally available.
> 
> Fengguang in your testing on any architechtures is atomic64_t missing on anything except some m68k subarchtechtures?

Eric, it only complaints for m68k, among the architechtures the build
tests covered (alpha arm avr32 blackfin cris frv h8300 i386 ia64 m32r
m68k mips mn10300 openrisc parisc powerpc s390 sh sparc sparc64 tile
um x86_64 xtensa).

Thanks,
Fengguang
