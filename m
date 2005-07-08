From: randy_dunlap <rdunlap@xenotime.net>
Date: Fri, 08 Jul 2005 17:29:10 +0000
Subject: Re: [KJ] [PATCH 0/15] decrapify FlashPoint
Message-Id: <20050708102910.2068ed3e.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============04847325965187288=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507070320.14314.adobriyan@gmail.com>
In-Reply-To: <200507070320.14314.adobriyan@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============04847325965187288==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 7 Jul 2005 03:20:14 +0400 Alexey Dobriyan wrote:

| Don't pay attention to whatever whitespace left/added on the way. Lindent will
| take care of it.
| 
| 1) Mostly remove unused #defines.
| 2) Remove wrappers.
| 
| 3-7) Switch to sane types.
| 8-13) Remove useless typedefs.
| 
| 	Splitted for your reviewing pleasure.

Looks sane to me.

| 14) Lindent the sucker.
| 15) return (*); => return *;
| 
| Compile tested with CONFIG_SCSI_OMIT_FLASHPOINT=y and =n.

Good job.  Some people forget to do things like that.  :)

| If somebody will find useful the following script used in preparation of the
| series, I'll be glad.

Thanks.

| ============================================================================
| $ cat prepare
| #!/bin/sh
| 
| PATCH="$1"
| TEMP=${PATCH}_
| echo "[PATCH] " >$TEMP
| echo "" >>$TEMP
| echo "Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>" >>$TEMP
| echo "---" >>$TEMP
| echo "" >>$TEMP
| diffstat -p1 $PATCH >>$TEMP
| echo "" >>$TEMP
| cat $PATCH >>$TEMP
| mv $TEMP $PATCH

Reference for others:  Linus wrote an email about the canonical
patch format.  It's here:
http://marc.theaimsgroup.com/?l=linux-kernel&m=111289556807316&w=2

Alexey's prepare script is similar to what I use, genpatch,
which is contained in
  http://www.xenotime.net/linux/scripts/patching-scripts-003.tar.gz

---
~Randy

--===============04847325965187288==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============04847325965187288==--
