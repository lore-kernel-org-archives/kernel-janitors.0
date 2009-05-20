From: Christian =?iso-8859-1?q?Borntr=E4ger?= <borntrae@de.ibm.com>
Date: Wed, 20 May 2009 10:38:15 +0000
Subject: Re: Are the cast necessary in function "kfree"?
Message-Id: <200905201238.16160.borntrae@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5c43c2d40905200330p5b14be2ey567bc493374e09b3@mail.gmail.com>
In-Reply-To: <5c43c2d40905200330p5b14be2ey567bc493374e09b3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?q?Andr=E9_Lopes?= <andre.neo.net@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Am Mittwoch 20 Mai 2009 12:30:21 schrieb Andr=E9 Lopes:

I only looked at the s390 parts:

> arch/s390/include/asm/idals.h:110: kfree((void *)(unsigned long) ccw->cda=
);
This cast is necessary since cda is an u32 even on 64bit machines.

> drivers/s390/char/vmur.c:188:        kfree((void *)(addr_t) ptr->cda);
dito.

Christian


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
