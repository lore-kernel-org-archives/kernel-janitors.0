From: Oliver Neukum <oneukum@suse.de>
Date: Tue, 05 Jun 2007 11:33:11 +0000
Subject: Re: [KJ] Re: [PATCH] bugfix GFP_KERNEL -> GFP_ATOMIC in spin_locked
Message-Id: <200706051333.12219.oneukum@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87odjvu1on.fsf@wanadoo.fr> <20070604210018.0eaa20a0.akpm@linux-foundation.org> <87k5uimzkh.fsf@wanadoo.fr>
In-Reply-To: <87k5uimzkh.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Am Dienstag, 5. Juni 2007 13:05 schrieb Yoann Padioleau:
> Ok. Do you have a preference on the format ? =A0a <file>:<line> format =
=A0?
>=20
> Is there a place that gathered all those implicit programming rules=20
> (that copy_from_user must not be called inside a spinlock, etc) so that
> I can translate them in a script for our tool.

How much C does your tool understand? You might basically
test for code paths that go to "might_sleep()"

	Regards
		Oliver

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
