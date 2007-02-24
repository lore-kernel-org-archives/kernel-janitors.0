From: "liran tal" <liransgarage@gmail.com>
Date: Sat, 24 Feb 2007 10:24:59 +0000
Subject: [KJ] Kernel module programming.
Message-Id: <3ed55890702240224n1df079cbh3c28b68d7c4cb1bd@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1030500383=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============1030500383==
Content-Type: multipart/alternative; boundary="----------=_1172312821-486-523"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1172312821-486-523
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey everyone,

This might be a bit off-topic but I figured it's something general and there
are many experienced
developers here who could probably answer this for me.

I want to develop a kernel module that will be used to account for the
input/output of files on the system
and was wondering about doing it by intercepting the open() / read() /
write() system calls with their size attributes
and using that as a counter. (Later on, I wish to attach to a specific pid
or account for all i/o for a specific user but that's later).

I've been going over several Linux Kernel programming books among them
TLDP's Linux kernel programming where the
author mention that using the method of catching the original syscall table
to do some stuff and then returning
the original syscall again to the kernel is a bad habit, moreover, it's not
really supported in 2.6

So here comes my question - how do I go about doing that? Should I go with
the intercepting thing or are
there more elegant ways?



Thanks in advance.
Sincerely, Liran.

------------=_1172312821-486-523
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey everyone,<br><br>This might be a bit off-topic but I figured it&#39;s something general and there are many experienced<br>developers here who could probably answer this for me.<br><br>I want to develop a kernel module that will be used to account for the input/output of files on the system
<br>and was wondering about doing it by intercepting the open() / read() / write() system calls with their size attributes<br>and using that as a counter. (Later on, I wish to attach to a specific pid or account for all i/o for a specific user but that&#39;s later).
<br><br>I&#39;ve been going over several Linux Kernel programming books among them TLDP&#39;s Linux kernel programming where the<br>author mention that using the method of catching the original syscall table to do some stuff and then returning
<br>the original syscall again to the kernel is a bad habit, moreover, it&#39;s not really supported in 2.6<br><br>So here comes my question - how do I go about doing that? Should I go with the intercepting thing or are<br>
there more elegant ways?<br><br><br><br>Thanks in advance.<br>Sincerely, Liran.<br><br>

------------=_1172312821-486-523--

--===============1030500383==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1030500383==--
