From: Marcel Holtmann <marcel@holtmann.org>
Date: Fri, 21 Jan 2005 00:38:07 +0000
Subject: [KJ] Re: [PATCH 17/39] net/capi: use
Message-Id: <1106267887.7955.40.camel@pegasus>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12161496617882017=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120234754.GE2600@us.ibm.com>
In-Reply-To: <20050120234754.GE2600@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: Max Krasnyansky <maxk@qualcomm.com>, BlueZ Mailing List <bluez-devel@lists.sourceforge.net>, kernel-janitors@lists.osdl.org

--===============12161496617882017==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Nishanth,

> Description: Use wait_event_interruptible_timeout() instead of custom
> wait-queue code. The first replacement is the most complicated as the various
> return conditions each indicate different things, apparently. The same effects
> are made after wait_event_interruptible_timeout() returns.

the first one makes the code look ugly. Remove it and re-submit.

Regards

Marcel



--===============12161496617882017==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12161496617882017==--
