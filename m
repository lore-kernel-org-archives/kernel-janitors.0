From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 22:07:11 +0000
Subject: [KJ] tokenring/olympic: printk messages
Message-Id: <20041022220711.GB11126@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84968532716964384=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84968532716964384==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Mike,

I was searching through the latest kernel for any remaining
schedule_timeout()s and came across 
drivers/net/tokenring/olympic::olympic_close(). While I understand that
the (potentially) one minute delay is in the device close code, and thus
is not a big deal, I thought I would ask about the printk messages that
immediately follow. It seemed inconsistent to me that signal_pending(current)
would indicate a timeout and so would schedule_timeout() returning a 0.
Also, why is the returning a 0 case described as "May not be fatal," but
the signal_pending() one is not? Just thought you should be made aware
of these issues, as they may be confusing to the user if they were to be
outputted.

Thanks,
Nish

--===============84968532716964384==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84968532716964384==--
