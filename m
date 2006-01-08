From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 08 Jan 2006 20:45:49 +0000
Subject: MODULE_VERSION useless? (was Re: [KJ] adding missing MODULE_* stuffs)
Message-Id: <20060108204549.GB5864@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72682440654000291=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051230000400.GS18040@outflux.net>
In-Reply-To: <20051230000400.GS18040@outflux.net>
To: Kees Cook <kees@outflux.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============72682440654000291==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 29, 2005 at 04:04:00PM -0800, Kees Cook wrote:
> Would patches towards adding missing MODULE_DESCRIPTION, MODULE_VERSION,
> and MODULE_AUTHOR stuff be taken?  While these aren't covered in the
> CodingStyle document, I did find reference to their preferred order in
> Documentation/i2c/porting-clients.txt where Greg KH said the order
> should be:
>
> MODULE_AUTHOR
> MODULE_DESCRIPTION
> MODULE_LICENSE /* last line of source */
>
> I'm curious where MODULE_VERSION should go, as well as
> MODULE_PARAM_DESC.
>
> Notably, AUTHOR, DESCRIPTION, and VERSION seem to be missing from the
> various examples in Documention/

I hate MODULE_VERSION. It stops making sense after the following
definition:

	Version of a module is a version of kernel it was shipped with.

Given:	module 8139too version 0.9.27 is buggy in somesuch way.
Question: which one?

There were quite a few nontrivial changes made since transition to git:
-----------------------------------------------------------------------
Christoph Lameter:
      Cleanup patch for process freezing

Jeff Garzik:
      [netdrvr 8139too] replace hand-crafted kernel thread with workqueue
      [netdrvr 8139too] use cancel_rearming_delayed_work() to cancel thread
      [netdrvr 8139too] use rtnl_shlock_nowait() rather than rtnl_lock_interruptible()
      [netdrvr 8139too] fast poll for thread, if an unlikely race occurs

John W. Linville:
      8139too: support ETHTOOL_GPERMADDR
      8139too: fix resume for Realtek 8100B/8139D

Olaf Hering:
      turn many #if $undefined_string into #ifdef $undefined_string

Pekka Enberg:
        8139too: use iomap for pio/mmio
-----------------------------------------------------------------------
None of the above changes touched MODULE_VERSION. It's still 0.9.27.

MODULE_VERSION is almost always outdated. You can't rely on it in
bugreports. All you can rely on is kernel version, be it 2.6.15-git1 or
2.6.15-0aec63e67c69545ca757a73a66f5dcf05fa484bf.


--===============72682440654000291==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72682440654000291==--
