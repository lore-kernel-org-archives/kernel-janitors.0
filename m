From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 07:52:05 +0000
Subject: Re: [cryptodev:master 38/41] arch/x86/crypto/crc32c-pcl-intel-asm.S:92: Error: bad register name `%r
Message-Id: <20120927075205.GA1353@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927074622.GA726@localhost>
In-Reply-To: <20120927074622.GA726@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 27, 2012 at 12:49:44AM -0700, Herbert Xu wrote:
> On Thu, Sep 27, 2012 at 03:46:22PM +0800, Fengguang Wu wrote:
> > Hi Tim,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
> > head:   11c8484924441def7941bdc62ddb03643bc8f989
> > commit: c4d68f14dfbbf075906a0dcf355e0392347efda9 [38/41] crypto: crc32c- Optimize CRC32C calculation with PCLMULQDQ instruction
> > config: i386-allmodconfig
> 
> Hi Fengguang:
> 
> Was this a 32-bit build or a 64-bit build?
> 
> I'll revert the patches for now.

It's a 32-bit build:

        make ARCH=i386 allmodconfig

Thanks,
Fengguang
