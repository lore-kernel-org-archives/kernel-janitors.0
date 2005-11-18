From: =?ISO-8859-1?Q?Daniel_Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Fri, 18 Nov 2005 11:57:18 +0000
Subject: [KJ] polling in drivers/cdrom/aztcd.c
Message-Id: <437DC19E.70407@comhem.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hello!

I saw this in version 2.6.14.1 of linux.
Does anybody have any input on this matter?

In the file there are several polling routines like the one below, and they=
 are repeatedly called.
The loop will repeat 8 million times before it times out!
I suspect we can make huge improvements here. I'm having 3 improvements in =
mind:
1. Time out based on actual time rather than on repetitions.
2. Sleep between each repetition. How can I sleep say.. 10-50 us? Is it pos=
sible?
3. On time out, return an error code. The callers always assume that the po=
lling succeeded!


static void pa_ok(void)
{
         aztTimeOutCount =3D 0;
         do {
                 aztIndatum =3D inb(DATA_PORT);
                 aztTimeOutCount++;
                 if (aztTimeOutCount >=3D AZT_TIMEOUT) {
                         printk("aztcd: Error Wait PA_OK\n");
                         break;
                 }
         } while (aztIndatum !=3D AFL_PA_OK);
}


Best Regards,
Daniel Marjam=E4ki


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
