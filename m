From: james4765@verizon.net
Date: Sat, 30 Oct 2004 19:46:27 +0000
Subject: [KJ] [RFC][PATCH 0/2] floppy: Cleanup work to floppy.c
Message-Id: <20041030194626.5280.96733.97927@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96783163657665694=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============96783163657665694==

The following two patches are an attempt to get a little sanity in
floppy.c by moving all static variable definitions to one place and
creating a floppy.h file.  It still needs work - this is only an effort
to partially untangle the file.

Sorry about the size of the diff - it was a bloody mess in there.  If you'd
rather have me re-do it so the creation of floppy.h and the variable relocation
are handled in different patches, I can do that (a little later - my head hurts
from hashing that stuff out).

I'd rather submit it here before dumping it on lkml.

Compile tested - both module and compiled-in.

Jim

--===============96783163657665694==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96783163657665694==--
