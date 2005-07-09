From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 09 Jul 2005 00:08:09 +0000
Subject: [KJ] Re: [PATCH 3/14] sound/usb: fix-up sleeping paths
Message-Id: <20050709000809.GJ2596@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19098136340299154=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============19098136340299154==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08.07.2005 [17:04:39 -0700], Nishanth Aravamudan wrote:
> From: Nishanth Aravamudan <nacc@us.ibm.com>

<snip>

> Description: Fix-up sleeping in sound/usb. Replace big_mdelay() with
> msleep() to guarantee the task delays as expected. This also involved
> replacing/removing custom sleep functions.

Sorry, forgot to CC: Kernel-Janitors.

Thanks,
Nish

--===============19098136340299154==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19098136340299154==--
