From: Andrew Morton <akpm@osdl.org>
Date: Sun, 16 Jan 2005 21:04:52 +0000
Subject: [KJ] Re: [PATCH 0/13] remove cli()/sti() in drivers/char/*
Message-Id: <20050116130452.10fabe52.akpm@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56670577453263515=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050116135223.30109.26479.55757@localhost.localdomain>
In-Reply-To: <20050116135223.30109.26479.55757@localhost.localdomain>
To: James Nelson <james4765@cwazy.co.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============56670577453263515==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

James Nelson <james4765@cwazy.co.uk> wrote:
>
> This series of patches removes the last cli()/sti()/save_flags()/restore_flags()
>  function calls in drivers/char.

I don't see much point in this, really.  Those cli() calls are a big fat
sign saying "broken on smp" and they now generate compile-time warnings
emphasising that.  These drivers still need to be fixed up - we may las
well leave them as-is until someone gets onto doing that.

--===============56670577453263515==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56670577453263515==--
