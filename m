From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Thu, 03 Mar 2005 18:18:01 +0000
Subject: Re: [KJ] 2.6.11-kj
Message-Id: <200503032116.19120.adobriyan@mail.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302095710.GA3745@nd47.coderock.org>
In-Reply-To: <20050302095710.GA3745@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 03 March 2005 19:43, Nishanth Aravamudan wrote:
> On Thu, Mar 03, 2005 at 06:41:19PM +0200, Alexey Dobriyan wrote:
> > On Wednesday 02 March 2005 11:57, Domen Puncer wrote:
> > 
> > > int_sleep_on-drivers_cdrom_mcdx.patch
> > >   From: Nishanth Aravamudan <nacc@us.ibm.com>
> > >   Subject: [KJ] [PATCH 16/20] cdrom/mcdx: remove 	interruptible_sleep_on_timeout() usage
> > 
> > drivers/cdrom/mcdx.c:844:2: warning: mixing declarations and code
> > drivers/cdrom/mcdx.c: In function `mcdx_delay':
> > drivers/cdrom/mcdx.c:844: warning: ISO C90 forbids mixed declarations and code
> 
> I do not see these compile-time warnings.

Just use gcc 2.95.3. Nice compile error.

	Alexey
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
