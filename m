From: Marcel Holtmann <marcel@holtmann.org>
Date: Fri, 21 Jan 2005 00:32:14 +0000
Subject: [KJ] Re: [PATCH 18/39] net/core: use wait_event_timeout()
Message-Id: <1106267534.7955.36.camel@pegasus>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71748241342263475=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120235123.GG2600@us.ibm.com>
In-Reply-To: <20050120235123.GG2600@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: Max Krasnyansky <maxk@qualcomm.com>, bluez-devel@lists.sf.net, kernel-janitors@lists.osdl.org

--===============71748241342263475==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Nishanth,

> Description: Use wait_event_timeout() instead of custom wait-queue code.
> The current code uses TASK_INTERRUPTIBLE but only cares about timing out and the
> wq event taking place (does not actively do anything in response to signals), so
> wait_event_timeout() should be ok.

this one results in:

  CC [M]  net/bluetooth/hidp/core.o
net/bluetooth/hidp/core.c: In function `hidp_session':
net/bluetooth/hidp/core.c:547: warning: passing arg 1 of `prepare_to_wait' from incompatible pointer type
net/bluetooth/hidp/core.c:547: warning: passing arg 1 of `finish_wait' from incompatible pointer type
net/bluetooth/hidp/core.c:551: warning: passing arg 1 of `prepare_to_wait' from incompatible pointer type
net/bluetooth/hidp/core.c:551: warning: passing arg 1 of `finish_wait' from incompatible pointer type

Please fix this and re-submit.

Regards

Marcel



--===============71748241342263475==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71748241342263475==--
