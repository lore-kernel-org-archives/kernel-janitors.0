From: Joe Perches <joe@perches.com>
Date: Fri, 06 Oct 2017 02:02:33 +0000
Subject: Re: [PATCH 1/2] powerpc/platforms/cell: Delete an error message for a failed memory allocation in th
Message-Id: <1507255353.4434.54.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <db9efaf4-f3d7-d5dc-b0b2-f20e418fa3c8@users.sourceforge.net>
 <62146108-5be0-c236-f404-4be122e162ac@users.sourceforge.net>
 <20171005220210.681f78e8@kitsune.suse.cz>
 <alpine.DEB.2.20.1710052205560.2626@hadrien>
 <20171005222949.3a288238@kitsune.suse.cz>
In-Reply-To: <20171005222949.3a288238@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>, linuxppc-dev@lists.ozlabs.org, SF Markus Elfring <elfring@users.sourceforge.net>

On Thu, 2017-10-05 at 22:29 +0200, Michal Such=E1nek wrote:
> I do not expect the kernel to generate a
> stack trace every time memory allocation fails. With all the hooks in
> the code it is hard to tell, though.

All [kv].alloc failures without __GFP_NOWARN call dump_stack()

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
