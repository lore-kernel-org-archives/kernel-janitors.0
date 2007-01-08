From: Thomas Petazzoni <thomas.petazzoni@enix.org>
Date: Mon, 08 Jan 2007 13:11:25 +0000
Subject: Re: [KJ] proper casting (if any) in copy_to_user() calls?
Message-Id: <20070108141125.3818ed01@thomas.toulouse>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,

Le Sat, 6 Jan 2007 13:32:30 +0200 (SAST),
"Jaco Kroon" <jaco@kroon.co.za> a =E9crit :

> Whilst we're on the topic, I know it's "bad" to dereference a
> user-space pointer, but from what I understand the actual pointer
> value remains the same, so as long as you are in the context of the
> userspace program that gave you the pointer, the VMT should correctly
> interpret it right?
>=20
> So what exactly is so bad about dereferencing userspace pointers?

The page may not be mapped, for example if it has been swapped out. The
copy_to_user() and copy_from_user() macros are specifically designed to
handle that: they add an entry in an exception table, which is read by
the page fault handler. An entry in that exception table says to the
page fault handler "yeah, ok, a page fault occured from the kernel, but
it's perfectly controlled, it's inside a copy_from_user() or
copy_to_user() macro".

Without an entry in the exception table (which would be the case if you
simply dereference an userspace pointer in the kernel code), then you
would get a panic from the page fault handler if the page has been
unmapped for some reason (not yet mapped, swapped out, or whatever).

You can have a look at how the copy_to_user()/copy_from_user() macros
are implemented: they do some ELF-section trickery to add an entry in
the exception table.

(Don't hesitate to correct me if I'm wrong).

Sincerly,

Thomas
--=20
Thomas Petazzoni - thomas.petazzoni@enix.org
http://{thomas,sos,kos}.enix.org - http://www.toulibre.org
http://www.{livret,agenda}dulibre.org
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
