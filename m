From: "Vaughn E. Clinton" <vclinton@msn.com>
Date: Tue, 19 Jun 2007 03:52:09 +0000
Subject: [KJ] How to create a pxeboot initrd from scratch
Message-Id: <BAY103-DAV13DFBDCDC54FEC06B93E9CE120@phx.gbl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5086339148358656783=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.

--===============5086339148358656783==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0157_01C7B1F2.EB6B2CA0"

This is a multi-part message in MIME format.

------=_NextPart_000_0157_01C7B1F2.EB6B2CA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I need help - BAD.  I'm not sure where to ask this question, but maybe =
someone on this list can redirect me.  I'm trying to pxeboot across a =
myri10ge card to initiate a kick start installation with RHEL 4.3.  =
Unfortunately, the base pxeboot kernel image is 2.6.9-34 and it does not =
contain the myri10ge kernel module.

I've been able to build the kernel module against the 2.6.9-34 kernel =
and move it over to my original "images/pxeboot/initrd.img" file by =
tearing it open and adding the file to the "/lib/" directory of the =
initrd file and modifying the modules-info and depends file with respect =
to the initrd image itself..

Now, this image is not based on "busybox" and I'm not familiar enough =
with the process, but I that I think it is using "loader" (I think it's =
the anaconda loader binary) and "init" (it looks like a minimal version =
of "init") to load the kernel modules that are detected and mount the =
virtual file systems. =20

What is keeping me from completing the process is that I can't see the =
myri10ge card at that level unless I get "udevstart" to run (which is =
kludge that I use for calling via the "linuxrc" script and busybox).

Anyway, I guess my million dollar question is , "how do I get the =
booting kernel/initrd to recognize the device in a non-busybox =
environment"?  What should I add to the native =
"images/pxeboot/initrd.img" file to make the magic happen?

Thanks in advance ...

Regards,

------=_NextPart_000_0157_01C7B1F2.EB6B2CA0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type =
content=3Dtext/html;charset=3Diso-8859-1>
<STYLE></STYLE>

<META content=3D"MSHTML 6.00.6000.16481" name=3DGENERATOR></HEAD>
<BODY id=3DMailContainerBody=20
style=3D"PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FONT-SIZE: 10pt; =
COLOR: #000000; PADDING-TOP: 15px; FONT-FAMILY: Arial"=20
bgColor=3D#ffffff leftMargin=3D0 topMargin=3D0 CanvasTabStop=3D"true" =
acc_role=3D"text"=20
name=3D"Compose message area">
<DIV>I need help - BAD.&nbsp; I'm not sure where to ask this question, =
but maybe=20
someone on this list can redirect me.&nbsp; I'm trying to pxeboot across =
a=20
myri10ge card to initiate a kick start installation with RHEL 4.3.&nbsp; =

Unfortunately, the base pxeboot kernel image is 2.6.9-34 and it does not =
contain=20
the myri10ge kernel module.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I've been able to build the kernel module against the 2.6.9-34 =
kernel and=20
move it over to my original "images/pxeboot/initrd.img" file by tearing =
it open=20
and adding the file to the "/lib/" directory of the initrd file and =
modifying=20
the modules-info and depends file with respect to the initrd image=20
itself..</DIV>
<DIV>&nbsp;</DIV>
<DIV>Now, this image is not based on "busybox" and I'm not familiar =
enough with=20
the process, but I&nbsp;that I think it is using "loader" (I think it's =
the=20
anaconda loader binary) and "init" (it looks like a minimal version of =
"init")=20
to load the kernel modules that are detected and mount the virtual file=20
systems.&nbsp; </DIV>
<DIV>&nbsp;</DIV>
<DIV>What is keeping me from completing the process is that I =
can't&nbsp;see the=20
myri10ge card at that level unless I get "udevstart" to run (which is =
kludge=20
that I use for calling via the "linuxrc" script and busybox).</DIV>
<DIV>&nbsp;</DIV>
<DIV>Anyway, I guess my million dollar question is , "how do I get the =
booting=20
kernel/initrd to recognize the device in a non-busybox =
environment"?&nbsp; What=20
should I add to the native "images/pxeboot/initrd.img" file to make the =
magic=20
happen?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks in advance ...</DIV>
<DIV>&nbsp;</DIV>
<DIV>Regards,</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0157_01C7B1F2.EB6B2CA0--


--===============5086339148358656783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============5086339148358656783==--
