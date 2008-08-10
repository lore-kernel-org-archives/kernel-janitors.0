From: Himanshu Chauhan <chauhan.jpr@gmail.com>
Date: Sun, 10 Aug 2008 12:18:33 +0000
Subject: memcpy on const pointer, warning in smbfs/cache.c
Message-Id: <g7mlka$8lc$1@ger.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Dear all,

I pulled out latest source from Linus's git tree. During compilation of=20
smbfs/cache.c in line 148 I got a warning stating

  warning: passing argument 1 of =91__constant_memcpy=92 discards qualifier=
s=20
from pointer target type

This was in function smb_fill_cache where memcpy is being used as following:

memcpy((char *) newdent->d_name.name, qname->name,
		       newdent->d_name.len);

d_name is of type struct qstr and in qstr name is defined as const=20
unsigned char *.

struct qstr {
	unsigned int hash;
	unsigned int len;
	const unsigned char *name;
};

So this type cast is wrong.

Is it ok to fix this by defineing name as unsigned char * rather than as=20
const unsigned char *?

Regards
--Himanshu

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
