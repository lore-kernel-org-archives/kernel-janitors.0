From: Gustavo Franco <stratus@acm.org>
Date: Sat, 29 May 2004 22:10:16 +0000
Subject: [Kernel-janitors] TODO list.
Message-Id: <40B91806.7070808@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56116443011502692=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56116443011502692==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi list,

I can see that greg suggestion to use msleep() for
the most of longer delays on the kernel was included
on the TODO list, but his tip was not merged with
the Matthew Wilcox: `Calling yield() considered harmful`.

Who can fix it?

Thanks,
Gustavo Franco
p.s: I will resent my patches using msleep() in the
next week.

--===============56116443011502692==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56116443011502692==--
