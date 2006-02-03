From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Fri, 03 Feb 2006 05:10:43 +0000
Subject: [KJ] the process patches go through on their way to Linus' kernel
Message-Id: <a01a16b50602022110r51c13a09s7a1fd854d46faa56@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi. I am trying to understand and get an overview of the
process patches go through on their way to Linus' kernel.


 +--------------+
 |Some Developer|
 +--------------+
         |
         |
        \_/
 +---------------------+
 |create and send patch|
 +---------------------+
         |
         +-------------------------------------------------+
         |                                                 |
         |                                                 |
        \_/                                               \_/
 +--------------------------------------+    +-----------------------------=
---+
 |only to kernel-janitors@lists.osdl.org|    |also CC subsystem mailing lis=
t, |
 +--------------------------------------+    |maintainer, trivial patch mon=
key|
         |                            ,,-~-->|linux-kernel@vger.kernel.org =
   |
         |                      ,,-~~'       |or torvalds@osdl.org         =
   |
        \_/               ,,-~~'             +-------------+---------------=
---+
 +-----------+      ,,-~~'                                /
 |black box 1|<--~~'                                     /
 +-----------+                                          /
         |                                             /
         |                                            /
        \_/                                          /
 +-----------------------+                          /
 |http://coderock.org/kj/|                         /
 +-----------------------+                        /
         |                                       /
         |                                      /
        \_/                                    /
 +-----------+                                /
 |black box 2|                               /
 +-----------+                              /
         |                                 /
         +--------------------------------+
         |
        \_/
 +--------------------------------------------------------------------+
 |git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git|
 +--------------------------------------------------------------------+


How much of the kernel janitor work is passing through
http://coderock.org/kj/, most, some, little?


For black box 1 I assume a set of janitors have commit access to
http://coderock.org/kj/, and if the patch accepted (and not CC'ed to
maintainer or someone else accepting/rejecting it), the patch ends
up there.

Some older documents
(http://www.advogato.org/proj/Linux%20Kernel%20Janitor/ and
http://archive.linuxsymposium.org/ols2003/Proceedings/All-Reprints/Reprint-=
Melo-OLS2003.pdf)
gives a list of names but I am not able to find any current list.

For black box 2 I am more unsure. How does patches go from
http://coderock.org/kj/ to git://.../torvalds/linux-2.6.git?

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
