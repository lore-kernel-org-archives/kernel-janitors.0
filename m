From: Oliver Neukum <oliver@neukum.org>
Date: Fri, 21 Jan 2005 22:02:32 +0000
Subject: [KJ] Re: [linux-usb-devel] [PATCH 36/39] usb/kaweth: use
Message-Id: <200501212302.32887.oliver@neukum.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51863214706584904=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51863214706584904==
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Freitag, 21. Januar 2005 22:36 schrieb Nishanth Aravamudan:
> Hi,
> 
> Please consider applying.
> 
> Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> now unused variables. I changed the code to only add to the wait-queue if
> necessary, but I'm not sure if this is correct.

The macro seems essentially identical. If it compiles, what problems are
you afraid of?

	Regards
		Oliver

--===============51863214706584904==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51863214706584904==--
