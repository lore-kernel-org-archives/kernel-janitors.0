From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 04 Dec 2005 19:57:52 +0000
Subject: Re: [KJ] [PATCH 1/21] polling loops: change exit condition to
Message-Id: <200512042057.52855.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43923469.3090808@gmail.com>
In-Reply-To: <43923469.3090808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Sonntag 04 Dezember 2005 01:12 schrieb Marcin Slusarz:
> hello everyone
> here is the first part of patch which changes many polling loops to use
> jiffies and time_after / time_before instead of counters
> most of the changes are in drivers directory (except first patch)
> as it is my first patch for linux kernel, feel free to point out any
> mistake you'll find

Hmm, what happened to the poll_event API that Nish had suggested
some time ago for this problem? Was there an actual reason against
merging it or did the patch just get lost?

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
