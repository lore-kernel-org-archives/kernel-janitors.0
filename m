From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 06 Jul 2005 23:20:14 +0000
Subject: [KJ] [PATCH 0/15] decrapify FlashPoint
Message-Id: <200507070320.14314.adobriyan@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13615087762168598=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13615087762168598==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't pay attention to whatever whitespace left/added on the way. Lindent will
take care of it.

1) Mostly remove unused #defines.
2) Remove wrappers.

3-7) Switch to sane types.
8-13) Remove useless typedefs.

	Splitted for your reviewing pleasure.

14) Lindent the sucker.
15) return (*); => return *;

Compile tested with CONFIG_SCSI_OMIT_FLASHPOINT=y and =n.

If somebody will find useful the following script used in preparation of the
series, I'll be glad.
============================================================================
$ cat prepare
#!/bin/sh

PATCH="$1"
TEMP=${PATCH}_
echo "[PATCH] " >$TEMP
echo "" >>$TEMP
echo "Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>" >>$TEMP
echo "---" >>$TEMP
echo "" >>$TEMP
diffstat -p1 $PATCH >>$TEMP
echo "" >>$TEMP
cat $PATCH >>$TEMP
mv $TEMP $PATCH

--===============13615087762168598==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13615087762168598==--
