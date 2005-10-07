From: "Milind A Choudhary\(Patni\)" <milind.choudhary@patni.com>
Date: Fri, 07 Oct 2005 10:53:41 +0000
Subject: RE: [KJ] [PATCH] printk : kernel/softirq.c
Message-Id: <040c01c5cb2c$cff8dd40$5f051aac@pcp42831>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----------=_1128682099-9085-8"
List-Id: <kernel-janitors.vger.kernel.org>
References: <03ca01c5cb00$c020f0f0$5f051aac@pcp42831>
In-Reply-To: <03ca01c5cb00$c020f0f0$5f051aac@pcp42831>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

------------=_1128682099-9085-8
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Christophe Lucas [clucas@rotomalug.org] Wrote::

>
>Milind A Choudhary(Patni) (milind.choudhary@patni.com) wrote:
>> Description:
>> printk() calls should include appropriate KERN_* constant.
>> 
>> Signed-off-by: Milind A Choudhary <milind.choudhary@patni.com>
>
>Hi,
>
>You seems to make printk patch. Have you made all patches for arch/i386
>as you have begun ?
>
These are my first patches thats why i thougt
doing some printk work would be a  good startup..
I've started looking into kernel/* 
haven't yet looked at arch/i386.
are you planning to take it up?

I'd like to know how do we,@ KJ, ensure that there is no repetition of work..
is the work delegated or voluntarily taken up throgh such discussions only?
kindly let me know.

~Milind



http://www.patni.com
World-Wide Partnerships. World-Class Solutions.
_____________________________________________________________________

This e-mail message may contain proprietary, confidential or legally
privileged information for the sole use of the person or entity to
whom this message was originally addressed. Any review, e-transmission
dissemination or other use of or taking of any action in reliance upon
this information by persons or entities other than the intended
recipient is prohibited. If you have received this e-mail in error
kindly delete  this e-mail from your records. If it appears that this
mail has been forwarded to you without proper authority, please notify
us immediately at netadmin@patni.com and delete this mail. 
_____________________________________________________________________

------------=_1128682099-9085-8
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

------------=_1128682099-9085-8--
